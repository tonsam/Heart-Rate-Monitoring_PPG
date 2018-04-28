function [] = script(training_path, testing_path, saving_path)
    clc
    clear all
    close all

    tic
    Files = dir(testing_path)
    counter = 1;
    for k=1:length(Files)
        FileNames=Files(k).name
        if FileNames == '.'
            continue
        elseif Filenames == '..'
            continue
        end
        str = strcat(testing_path, FileNames)
        load str
        L = length(sig);
        pl = -1, pBPM = -1, ptc = 0, plssr = 0, HR = [];
        for i=20:-1:1%floor((x-1000)/250+1)
            x = sig(:,(i-1)*250+1:((i-1)*250) + 1000);
            y = x;
            [cl, cBPM, tr, lssr] = SMART(y, pl, pBPM, ptc, 1000, 125, plssr)
            pl = cl;
            pBPM = cBPM;
            ptc = tr;
            plssr = lssr;
        end
        for i=1:125%floor((x-1000)/250+1)
            x = sig(:,(i-1)*250+1:((i-1)*250) + 1000);
            y = x;
            [cl, cBPM, tr, lssr] = SMART(y, pl, pBPM, ptc, 1000, 125, plssr);
            pl = cl;
            pBPM = cBPM;
            ptc = tr;
            plssr = lssr;
            HR = [HR; cBPM];
        end
        HR
    end
    toc
end