module Solids.Tetrahedron where

import List exposing (map)
import Math.Vector3 exposing (Vec3, vec3)
import Solids.Common exposing (FaceVertex, Position, withNormals)
import WebGL exposing (Triangle)

wires : List (Triangle (Position {}))
wires = 
  let p1 = { pos = vec3 1 1 1 }
      p2 = { pos = vec3 1 -1 -1 }
      p3 = { pos = vec3 -1 1 -1 }
      p4 = { pos = vec3 -1 -1 1 }
  in [(p1,p2,p3),(p1,p3,p4),(p1,p4,p2),(p2,p3,p4)]

faces : List (Triangle (FaceVertex (Position {})))
faces = map withNormals wires