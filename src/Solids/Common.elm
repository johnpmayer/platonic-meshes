module Solids.Common where

import Math.Vector3
import Math.Vector3 exposing (cross, normalize, sub, Vec3, vec3)
import WebGL exposing (Triangle, map)

type alias Position a = { a | pos : Vec3 }

faceNormal : Triangle (Position a) -> Vec3
faceNormal (p1,p2,p3) = 
  let v1 = sub p2.pos p1.pos
      v2 = sub p3.pos p1.pos
  in normalize <| cross v1 v2

type alias FaceVertex a = { a | norm : Vec3 }
  
withNormals : Triangle (Position a) -> Triangle (FaceVertex (Position a))
withNormals t =
  let norm = faceNormal t
  in map (\p -> {p | norm = norm}) t