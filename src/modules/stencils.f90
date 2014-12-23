module stencils
  
  !      ******************************************************************
  !      *                                                                *
  !      * stencils defines indices for several types of stencils. These  *
  !      * are useful for setting block in dRdw,dRdwPre or dRdx depending *
  !      * on the type of equations  being solved                         *
  !      *                                                                *
  !      ******************************************************************

  use precision
  implicit none

  ! Euler stencils
  integer(kind=intType), parameter :: N_euler_pc   = 7
  integer(kind=intType), parameter :: N_euler_drdw = 13
  integer(kind=intType), parameter :: N_euler_drdx = 32
  integer(kind=intType), parameter :: N_euler_force_w = 2
  integer(kind=intType), parameter :: N_euler_force_x = 4

  integer(kind=intType), dimension(7 ,3), target :: euler_pc_stencil
  integer(kind=intType), dimension(13,3), target :: euler_drdw_stencil
  integer(kind=intType), dimension(32,3), target :: euler_drdx_stencil
  integer(kind=intType), dimension(2, 3), target :: euler_force_w_stencil
  integer(kind=intType), dimension(4, 3), target :: euler_force_x_stencil

  ! Viscous stencils
  integer(kind=intType), parameter :: N_visc_pc   = 27
  integer(kind=intType), parameter :: N_visc_drdw = 33
  integer(kind=intType), parameter :: N_visc_drdx = 64
  integer(kind=intType), parameter :: N_visc_force_w = 18
  integer(kind=intType), parameter :: N_visc_force_x = 48

  integer(kind=intType), dimension(27,3), target :: visc_pc_stencil
  integer(kind=intType), dimension(33,3), target :: visc_drdw_stencil
  integer(kind=intType), dimension(64,3), target :: visc_drdx_stencil
  integer(kind=intType), dimension(18, 3), target :: visc_force_w_stencil
  integer(kind=intType), dimension(48, 3), target :: visc_force_x_stencil
  
end module stencils
       
subroutine initialize_stencils
  
  use stencils
  implicit none
  integer(kind=intType) :: i,j,k,ii

  ! -------- Euler PC Stencil ---------
  euler_pc_stencil(1,:) = (/ 0, 0, 0 /)
  euler_pc_stencil(2,:) = (/-1, 0, 0 /)
  euler_pc_stencil(3,:) = (/ 1, 0, 0 /)
  euler_pc_stencil(4,:) = (/ 0,-1, 0 /)
  euler_pc_stencil(5,:) = (/ 0, 1, 0 /)
  euler_pc_stencil(6,:) = (/ 0, 0,-1 /)
  euler_pc_stencil(7,:) = (/ 0, 0, 1 /)

 ! ---------- Euler drdw Stencil ---------
  euler_drdw_stencil(1 ,:) = (/ 0, 0, 0 /)
  euler_drdw_stencil(2 ,:) = (/-2, 0, 0 /)
  euler_drdw_stencil(3 ,:) = (/-1, 0, 0 /)
  euler_drdw_stencil(4 ,:) = (/ 1, 0, 0 /)
  euler_drdw_stencil(5 ,:) = (/ 2, 0, 0 /)
  euler_drdw_stencil(6 ,:) = (/ 0,-2, 0 /)
  euler_drdw_stencil(7 ,:) = (/ 0,-1, 0 /)
  euler_drdw_stencil(8 ,:) = (/ 0, 1, 0 /)
  euler_drdw_stencil(9 ,:) = (/ 0, 2, 0 /)
  euler_drdw_stencil(10,:) = (/ 0, 0,-2 /)
  euler_drdw_stencil(11,:) = (/ 0, 0,-1 /)
  euler_drdw_stencil(12,:) = (/ 0, 0, 1 /)
  euler_drdw_stencil(13,:) = (/ 0, 0, 2 /)

  ! -------- Euler dRdx Stencil ---------------
  euler_drdx_stencil(1 ,:) = (/   -1,  0,  0 /)
  euler_drdx_stencil(2 ,:) = (/   -1,  0,  1 /)
  euler_drdx_stencil(3 ,:) = (/   -1,  1,  0 /)
  euler_drdx_stencil(4 ,:) = (/   -1,  1,  1 /)
  euler_drdx_stencil(5 ,:) = (/    0, -1,  0 /)
  euler_drdx_stencil(6 ,:) = (/    0, -1,  1 /)
  euler_drdx_stencil(7 ,:) = (/    0,  0, -1 /)
  euler_drdx_stencil(8 ,:) = (/    0,  0,  0 /)
  euler_drdx_stencil(9 ,:) = (/    0,  0,  1 /)
  euler_drdx_stencil(10,:) = (/    0,  0,  2 /)
  euler_drdx_stencil(11,:) = (/    0,  1, -1 /)
  euler_drdx_stencil(12,:) = (/    0,  1,  0 /)
  euler_drdx_stencil(13,:) = (/    0,  1,  1 /)
  euler_drdx_stencil(14,:) = (/    0,  1,  2 /)
  euler_drdx_stencil(15,:) = (/    0,  2,  0 /)
  euler_drdx_stencil(16,:) = (/    0,  2,  1 /)
  euler_drdx_stencil(17,:) = (/    1, -1,  0 /)
  euler_drdx_stencil(18,:) = (/    1, -1,  1 /)
  euler_drdx_stencil(19,:) = (/    1,  0, -1 /)
  euler_drdx_stencil(20,:) = (/    1,  0,  0 /)
  euler_drdx_stencil(21,:) = (/    1,  0,  1 /)
  euler_drdx_stencil(22,:) = (/    1,  0,  2 /)
  euler_drdx_stencil(23,:) = (/    1,  1, -1 /)
  euler_drdx_stencil(24,:) = (/    1,  1,  0 /)
  euler_drdx_stencil(25,:) = (/    1,  1,  1 /)
  euler_drdx_stencil(26,:) = (/    1,  1,  2 /)
  euler_drdx_stencil(27,:) = (/    1,  2,  0 /)
  euler_drdx_stencil(28,:) = (/    1,  2,  1 /)
  euler_drdx_stencil(29,:) = (/    2,  0,  0 /)
  euler_drdx_stencil(30,:) = (/    2,  0,  1 /)
  euler_drdx_stencil(31,:) = (/    2,  1,  0 /)
  euler_drdx_stencil(32,:) = (/    2,  1,  1 /)

  ! Euler force stencil for w
  euler_force_w_stencil(1, :) = (/0, 0, 0/)
  euler_force_w_stencil(2, :) = (/0, 0, 1/)
  
  ! Euler force stencil for x
  euler_force_x_stencil(1, :) = (/-1, -1, 0/)
  euler_force_x_stencil(2, :) = (/-1,  0, 0/)
  euler_force_x_stencil(3, :) = (/ 0, -1, 0/)
  euler_force_x_stencil(4, :) = (/ 0,  0, 0/)

  ! ---------- Visc PC Stencil -------

  ! Set the first 7 to the euler pc stencil
  visc_pc_stencil(1:7,:) = euler_pc_stencil

  ! And now for the remaining 20
  visc_pc_stencil(8, :) =   (/-1, -1, -1/)
  visc_pc_stencil(9, :) =   (/ 0, -1, -1/)
  visc_pc_stencil(10, :) =  (/ 1, -1, -1/)
  visc_pc_stencil(11, :) =  (/-1,  0, -1/)
  visc_pc_stencil(12, :) =  (/ 1,  0, -1/)
  visc_pc_stencil(13, :) =  (/-1,  1, -1/)
  visc_pc_stencil(14, :) =  (/ 0,  1, -1/)
  visc_pc_stencil(15, :) =  (/ 1,  1, -1/)

  visc_pc_stencil(16, :) =  (/-1, -1,  0/)
  visc_pc_stencil(17, :) =  (/ 1, -1,  0/)
  visc_pc_stencil(18, :) =  (/-1,  1,  0/)
  visc_pc_stencil(19, :) =  (/ 1,  1,  0/)

  visc_pc_stencil(20, :) =  (/-1, -1,  1/)
  visc_pc_stencil(21, :) =  (/ 0, -1,  1/)
  visc_pc_stencil(22, :) =  (/ 1, -1,  1/)
  visc_pc_stencil(23, :) =  (/-1,  0,  1/)
  visc_pc_stencil(24, :) =  (/ 1,  0,  1/)
  visc_pc_stencil(25, :) =  (/-1,  1,  1/)
  visc_pc_stencil(26, :) =  (/ 0,  1,  1/)
  visc_pc_stencil(27, :) =  (/ 1,  1,  1/)

  ! ------------ Visc dRdw Stencil -------------
  ! Dense 3x3x3 cube
  ii = 1
  do k=-1,1
     do j=-1,1
        do i=-1,1
           visc_drdw_stencil(ii, :) =  (/i, j, k/)
           ii = ii + 1
        end do
     end do
  end do
  
  ! Plus the 6 double halos
  visc_drdw_stencil(28, :) = (/-2, 0, 0 /)
  visc_drdw_stencil(29, :) = (/ 2, 0, 0 /)
  visc_drdw_stencil(30, :) = (/ 0,-2, 0 /)
  visc_drdw_stencil(31, :) = (/ 0, 2, 0 /)
  visc_drdw_stencil(32, :) = (/ 0, 0,-2 /)
  visc_drdw_stencil(33, :) = (/ 0, 0, 2 /)

  ! -------- Visc dRdx Stencil --------------
  ! Dense 4x4x4 cube
  ii = 1
  do k=-1,2
     do j=-1,2
        do i=-1,2
           visc_drdx_stencil(ii, :) =  (/i, j, k/)
           ii = ii + 1
        end do
     end do
  end do

  ! --------- Visc force stencil for w ----------
  ! 3x3 on surface and two levels high
  ii = 1
  do k=0, 1
     do j=-1,1
        do i=-1,1
           visc_force_w_stencil(ii, :) = (/i, j, k/)
           ii = ii + 1
        end do
     end do
  end do
  
  ! ---------- Visc force stencil for x -----------
  ! 4x4 on surface and two levels high
  ii = 1
  do k=-1,1
     do j=-2,1
        do i=-2,1
           visc_force_x_stencil(ii, :) =  (/i, j, k/)
           ii = ii + 1
        end do
     end do
  end do

end subroutine initialize_stencils

