tic
load ../Project/Data/DATA_03_TYPE02.mat
L = length(sig);
pl = -1, pBPM = -1, ptc = 0, plssr = 0, HR = [];
for i=5:-1:1%floor((x-1000)/250+1)
    x = sig(:,(i-1)*250+1:((i-1)*250) + 1000);
    y = x;
    [cl, cBPM, tr, lssr] = SMART(y, pl, pBPM, ptc, 1000, 125, plssr)
    pl = cl;
    pBPM = cBPM;
    ptc = tr;
    plssr = lssr;
end
for i=1:5%floor((x-1000)/250+1)
    x = sig(:,(i-1)*250+1:((i-1)*250) + 1000);
    y = x;
    [cl, cBPM, tr, lssr] = SMART(y, pl, pBPM, ptc, 1000, 125, plssr);
    pl = cl;
    pBPM = cBPM;
    ptc = tr;
    plssr = lssr;
    HR = [HR cBPM];
end
HR
toc