load'../jnrrd/nrrd.ijs'

Bvec=:'../../heartfibers-dicom/grad_dirs.bvec'
DWI=:readnrrd'../../heartfibers-dicom/dwi.nrrd'
GDirs=: > ".each  <;._2 '-_'&charsub  (CR -.~ ]) fread Bvec
Bval=: 1000
'gx gy gz' =: GDirs
B=: 1,. - Bval * (gx^2),.(2*gx*gy),.(2*gx*gz),.(gy^2),.(2*gy*gz),.(gz^2)
Binv=: %. B
dot=: +/ .*

NB. DTI=:Binv dot ^. DWI