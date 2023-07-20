function [y1,y2,y3,y4] = fun_fft(data_fft,f_s,windowsize,signal,samp_rate)
Nn=windowsize;k=1;
%%
for j=50000:samp_rate:length(data_fft)%167
    y=data_fft(signal,j-Nn+1:j);%data
    y=y-mean(y);
    han=hanning(Nn);%hanning
    y_f=fft(han'.*y,Nn);
    df=f_s/Nn;%resolution
    f_x =(0:Nn-1)*df;%frequency x_axis
    shift_f = abs(fftshift(y_f));
    t_x0=f_x-f_s/2;
    t_x=t_x0(length(t_x0)/2+1:length(t_x0));%reshape the x-axis
    y_x=shift_f(length(t_x0)/2+1:length(t_x0))/Nn*2;%reshape the y-axis and obtain the real amplitude
    for i=1:length(t_x)
        if(t_x(i)<=10)
            y_x(i)=0.000001;
        end
    end
    %------------------------------- correct the amplitude and frequency 1
    Ah=y_x;
    [Amaxh,kh]=max(Ah);
    if Ah(kh-1)>Ah(kh+1)
        deltfh=(Ah(kh)/Ah(kh-1)-2)/(1+Ah(kh)/Ah(kh-1));
        f0h=(kh-1+deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    else
        deltfh=(Ah(kh)/Ah(kh+1)-2)/(1+Ah(kh)/Ah(kh+1));
        f0h=(kh-1-deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    end
    y_x(kh)=amh;t_x(kh)=f0h;
    Ah(kh)=amh;
    %------------------------------- correct the amplitude and frequency 2
    m_high=0;m_low=0;
    for i=1:10
        if(Ah(kh+i)<Ah(kh+i-1))
            m_high=m_high+1;
        else
            break
        end
        if(Ah(kh-i)<Ah(kh-i+1)&&(kh-i)>=1)
            m_low=m_low+1;
        else
            break
        end
    end
    for n=kh-m_low:kh+m_high
        Ah(n)=0.000001;
    end
    [Amaxh,kh]=max(Ah);
    if Ah(kh-1)>Ah(kh+1)
        deltfh=(Ah(kh)/Ah(kh-1)-2)/(1+Ah(kh)/Ah(kh-1));
        f0h=(kh-1+deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    else
        deltfh=(Ah(kh)/Ah(kh+1)-2)/(1+Ah(kh)/Ah(kh+1));
        f0h=(kh-1-deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    end
    y_x(kh)=amh;t_x(kh)=f0h;
    peak2_freq0=f0h;peak2_amp0=amh;
    %------------------------------- correct the amplitude and frequency 3
    Ah(kh)=0.000001;Ah(kh-1)=0.000001;Ah(kh+1)=0.000001;Ah(kh-2)=0;Ah(kh+2)=0.000001;
    [Amaxh,kh]=max(Ah);
    if Ah(kh-1)>Ah(kh+1)
        deltfh=(Ah(kh)/Ah(kh-1)-2)/(1+Ah(kh)/Ah(kh-1));
        f0h=(kh-1+deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    else
        deltfh=(Ah(kh)/Ah(kh+1)-2)/(1+Ah(kh)/Ah(kh+1));
        f0h=(kh-1-deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    end
    y_x(kh)=amh;t_x(kh)=f0h;
    peak3_freq0=f0h;peak3_amp0=amh;
    %------------------------------- correct the amplitude and frequency 4
    Ah(kh)=0.000001;Ah(kh-1)=0.000001;Ah(kh+1)=0.000001;Ah(kh-2)=0;Ah(kh+2)=0.000001;
    [Amaxh,kh]=max(Ah);
    if Ah(kh-1)>Ah(kh+1)
        deltfh=(Ah(kh)/Ah(kh-1)-2)/(1+Ah(kh)/Ah(kh-1));
        f0h=(kh-1+deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    else
        deltfh=(Ah(kh)/Ah(kh+1)-2)/(1+Ah(kh)/Ah(kh+1));
        f0h=(kh-1-deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    end
    y_x(kh)=amh;t_x(kh)=f0h;
    peak4_freq0=f0h;peak4_amp0=amh;
    %------------------------------- correct the amplitude and frequency 5
    Ah(kh)=0.000001;Ah(kh-1)=0.000001;Ah(kh+1)=0.000001;Ah(kh-2)=0;Ah(kh+2)=0.000001;
    [Amaxh,kh]=max(Ah);
    if Ah(kh-1)>Ah(kh+1)
        deltfh=(Ah(kh)/Ah(kh-1)-2)/(1+Ah(kh)/Ah(kh-1));
        f0h=(kh-1+deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    else      
        deltfh=(Ah(kh)/Ah(kh+1)-2)/(1+Ah(kh)/Ah(kh+1));
        f0h=(kh-1-deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    end
    y_x(kh)=amh;t_x(kh)=f0h;
    peak5_freq0=f0h;peak5_amp0=amh;
    %------------------------------- correct the amplitude and frequency 6
    Ah(kh)=0.000001;Ah(kh-1)=0.000001;Ah(kh+1)=0.000001;Ah(kh-2)=0;Ah(kh+2)=0.000001;
    [Amaxh,kh]=max(Ah);
    if Ah(kh-1)>Ah(kh+1)
        deltfh=(Ah(kh)/Ah(kh-1)-2)/(1+Ah(kh)/Ah(kh-1));
        f0h=(kh-1+deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    else      
        deltfh=(Ah(kh)/Ah(kh+1)-2)/(1+Ah(kh)/Ah(kh+1));
        f0h=(kh-1-deltfh)*f_s/Nn;
        amh=2/sinc(deltfh)*Amaxh*(1-deltfh^2);
    end
    y_x(kh)=amh;t_x(kh)=f0h;
    peak6_freq0=f0h;peak6_amp0=amh;
    %----------------------------------------------------------------------
    [m,n]=max(y_x);
    amp(k)=m;%record the amplitude
    freq(k)=t_x(n);%record the fundamental frequency
    time_rec(k)=data_fft(1,j);%record the corresponding time
    thd(k)=norm(interp1(t_x,y_x,[60*2 60*3 60*4 60*5 60*6 60*7]))/m;
    thd_357(k)=norm(interp1(t_x,y_x,[60*3 60*5 60*7]))/m;
    %-------------------------[top5 (except for the fundamental frequency)]
    top0_freq=[peak2_freq0;peak3_freq0;peak4_freq0;peak5_freq0;peak6_freq0];
    top0_amp=[peak2_amp0;peak3_amp0;peak4_amp0;peak5_amp0;peak6_amp0];
    [aa,bb]=sort(top0_amp,'descend'); %'ascend'/'descend'
    top5_freq(:,k)=top0_freq(bb(1:5))';
    top5_amp(:,k)=aa(1:5)';
    k=k+1;
end
%y1=amp;y2=freq;y3=thd;y4=thd_357;y5=top5_freq;y6=top5_amp;y7=time_rec;
y1=amp;y2=freq;y3=thd;y4=time_rec;
end












