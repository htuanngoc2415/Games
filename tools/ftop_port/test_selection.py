#!/usr/bin/env python3
"""Regression checks against the actual packaged XML/assets, not generated templates."""
import json
from pathlib import Path
import unittest
import xml.etree.ElementTree as ET
import zipfile
from PIL import Image
import io
from prepare_roster import PROJECT

class SelectionTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  cls.z=zipfile.ZipFile(PROJECT/'build/assets_with_gameplay.zip')
  cls.f={n.get('id'):n for n in ET.fromstring(cls.z.read('assets/config/fighter.xml'))}
  cls.select=ET.fromstring(cls.z.read('assets/config/select.xml'))
  cls.items=cls.select.findall('./char_list/row/item')
  cls.access={n.text.strip() for n in cls.items if n.text and n.text.strip()}
  for n in cls.items:cls.access.update(filter(None,n.get('moreFighter','').split(',')))
 @classmethod
 def tearDownClass(cls):cls.z.close()
 def pool(self,g):
  return {fid for fid,n in self.f.items() if fid in self.access and 'random' not in fid and (g==-1 or int(n.get('roster_group',n.get('comic_type')))==g)}
 def test_layout(self):
  rows=self.select.findall('./char_list/row')
  self.assertEqual([len(row) for row in rows],[12]*7)
  ids=[n.text.strip() for n in self.items if n.text and n.text.strip()]
  self.assertEqual(len(ids),len(set(ids)))
  self.assertEqual(sum(fid.startswith('ftop_') for fid in ids),25)
  ys=[100+i*(440/6)+float(row.get('offset').split(',')[1]) for i,row in enumerate(rows)]
  self.assertGreaterEqual(min(ys),70)
  self.assertLessEqual(max(ys)+60,515)
  self.assertTrue(all(b-a>=60 for a,b in zip(ys,ys[1:])))
 def test_franchise_pools(self):
  c=json.loads((PROJECT/'assets/config/crossover_select.json').read_text())
  self.assertEqual(self.pool(2),set(c['groups']['2']))
  self.assertEqual(self.pool(3),set(c['groups']['3']))
  self.assertEqual(len(self.pool(2)),10);self.assertEqual(len(self.pool(3)),15)
  for g in (0,1):self.assertFalse(any(fid.startswith('ftop_') for fid in self.pool(g)))
 def test_global_pool_and_variants(self):
  self.assertEqual(self.pool(-1),set.union(*(self.pool(g) for g in range(4))))
  self.assertEqual(len(self.pool(-1)),90)
  self.assertIn('ichigo_vizored_half',self.pool(-1))
  self.assertFalse(any(fid.startswith('xb_') or 'random' in fid for fid in self.pool(-1)))
 def test_original_roster_assists_and_combat_types(self):
  original=ET.parse(PROJECT/'assets/config/bvn_original/select.xml').getroot()
  def semantic(node):return (node.tag,dict(node.attrib),(node.text or '').strip(),[semantic(c) for c in node])
  self.assertEqual(semantic(self.select.find('assist_list')),semantic(original.find('assist_list')))
  self.assertTrue(all(n.get('comic_type')=='1' for fid,n in self.f.items() if fid.startswith('ftop_')))
 def test_new_random_icons(self):
  for fid in ('random_fairy_tail','random_one_piece'):
   self.assertIn(fid,self.access)
   self.assertEqual(Image.open(io.BytesIO(self.z.read('assets/face/'+fid+'.png'))).size,(50,48))
   self.assertIsNone(self.f[fid].find('file'))

if __name__=='__main__':unittest.main()
