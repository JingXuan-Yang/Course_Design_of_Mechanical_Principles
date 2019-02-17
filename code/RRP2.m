%����
%Dx,Dy,Ddx,Ddy,Dddx,Dddy D��λ�ã��ٶȣ����ٶ�
%Kx,Ky,Kdx,Kdy,Kddx,Kddy K��λ�ã��ٶȣ����ٶ�
%phi,dphi,ddphi ��·��λ�ã��ٶȣ����ٶ�
%LBC,LCD �˳�
%���
%Ex,Ey,Edx.Edy.Eddx,Eddy--E���λ�ã��ٶȣ����ٶ�
%s,v,a------�����ص�·��λ�ã��ٶȣ������ٶ�
function [Ex,Ey,Edx,Edy,Eddx,Eddy,s,v,a] = RRP(Dx,Dy,Ddx,Ddy,Dddx,Dddy,Kx,Ky,Kdx,Kdy,Kddx,Kddy,phi,dphi,ddphi,LDE,LEE)
A0 = (Dx - Kx)*sin(phi) - (Dy - Ky)*cos(phi);
theta_BC = asin((A0+LEE)/LDE) + phi;
Cx = Dx + LDE*cos(theta_BC);
Cy = Dy + LDE*sin(theta_BC);
%����λ��
s = (Cx - Kx + LEE*sin(phi))/cos(phi);
%����λ�÷���
Ex = Kx + s*cos(phi);
Ey = Ky + s*sin(phi);
%�����ٶ�
Q1 = Kdx - Ddx - dphi*(s*sin(phi) + LEE*cos(phi));
Q2 = Kdy - Ddy + dphi*(s*cos(phi) - LEE*sin(phi));
Q3 = LDE*sin(theta_BC)*sin(phi) + LDE*cos(theta_BC)*cos(phi);
omega_BC = (-Q1*sin(phi) + Q2*cos(phi))/Q3;
v = -(Q1*LDE*cos(theta_BC) + Q2*LDE*sin(theta_BC))/Q3;
%D����ٶ�
Edx = Kdx + v*cos(phi) - s*dphi*sin(phi);
Edy = Kdy + v*sin(phi) + s*dphi*cos(phi);
%���ٶȣ�LBC�˵ĽǼ��ٶȺͻ����ص��̵ļ��ٶ�
Q4 = Kddx - Dddx + omega_BC*omega_BC*LDE*cos(theta_BC) - ddphi*(s*sin(phi) + LEE*cos(phi))-dphi^2*(s*cos(phi) - LEE*sin(phi)) - 2*v*dphi*sin(phi);
Q5 = Kddy - Dddy + omega_BC*omega_BC*LDE*sin(theta_BC) + ddphi*(s*cos(phi) - LEE*sin(phi))-dphi^2*(s*sin(phi) + LEE*sin(phi)) + 2*v*dphi*cos(phi);
alpha_BC = (-Q4*sin(phi) + Q5*cos(phi))/Q3;
a = (-Q4*LDE*cos(theta_BC) - Q5*LDE*sin(theta_BC))/Q3;
%E�����
Eddx = Kddx + a*cos(phi) - s*ddphi*sin(phi) - s*dphi^2*cos(phi) - 2*v*dphi*sin(phi);
Eddy = Kddy + a*sin(phi) + s*ddphi*cos(phi) - s*dphi^2*sin(phi) + 2*v*dphi*cos(phi);
end