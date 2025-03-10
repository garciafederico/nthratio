      SUBROUTINE nthratio(Ear,Ne,Param,Ifl,Photar,Photer)
      implicit none
      INTEGER Ne , Ifl, i
      REAL Param(*) , Ear(0:Ne) , Photar(Ne), Photer(Ne)
      REAL PhotarkTin(Ne), Photar005(Ne)
      REAL ParamRNTHCOMP(6)

c     number of model parameters: 16
c     1: photon spectral index
c     2: plasma temperature in keV
c     3: (disc)blackbody temperature in keV
c     4: type of seed spectrum (0-blackbody, 1-diskbb)
c     5: redshift
c     6: Energy in keV at which the model is unity

      ParamRNTHCOMP(1) = Param(1)
      ParamRNTHCOMP(2) = Param(2)
      ParamRNTHCOMP(3) = Param(3)
      ParamRNTHCOMP(4) = 1
      ParamRNTHCOMP(5) = 0
      ParamRNTHCOMP(6) = 10

      call rnthcomp(Ear,Ne,ParamRNTHCOMP,Ifl,PhotarkTin,Photer)
      ParamRNTHCOMP(3) = 0.05
      call rnthcomp(Ear,Ne,ParamRNTHCOMP,Ifl,Photar005,Photer)

      photar = PhotarkTin/Photar005
      photer = 0.

      do i=0,ne-1
            if (ear(i) .gt. 100.0) then
                  photar(i+1) = photar(i)
            endif
      enddo

      RETURN
      END
