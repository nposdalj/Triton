function detXpos = lt_lVis_get_LTSA_Offset(inWindowDet,action,ltsaS)

global PARAMS
plotStart = PARAMS.ltsa.plotStartRawIndex;
plotDiff = abs(ltsaS - PARAMS.ltsa.dnumStart(plotStart));  %where are we in the first raw file?
rfDur = PARAMS.ltsa.dur(1); %assumes same duration of all rfs in LTSA
startPad = rfDur - lt_convertDatenum(plotDiff,'seconds'); %figure out padding to add to detstartOff for first raw file
tol = datenum(0,0,0,0,0,.00001);%tolerance for difference between raw file start/end and actual start time of detection

if strcmp(action,'starts')
    for iWin = 1:size(inWindowDet,1)
        winDetWavIdx{iWin} = find(PARAMS.ltsa.dnumStart<=inWindowDet(iWin,1)& inWindowDet(iWin,1)<=PARAMS.ltsa.dnumEnd);
        if isempty(winDetWavIdx{iWin})&& min(abs(PARAMS.ltsa.dnumStart-inWindowDet(iWin,1)))<tol %if nothing is found, check if two are actually equal but have very small difference
            [~,winDetWavIdx{iWin}] = min(abs(PARAMS.ltsa.dnumStart - inWindowDet(iWin,1)));
        end
        if size(winDetWavIdx{iWin},2)>1
            winDetWavIdx{iWin} = winDetWavIdx{iWin}(1);
            disp('WARNING! Detection start time found in two raw files')
        end
    end
    
    wDWIdx = [winDetWavIdx{:}];
    winDetWavs = PARAMS.ltsa.dnumStart(wDWIdx)';
    detstartOff = (wDWIdx - (plotStart+1)).*rfDur+startPad; %find offset of raw file from start of LTSA
    detWavOff = inWindowDet(:,1) - winDetWavs;
    detWavOffSec = lt_convertDatenum(detWavOff,'seconds');
    detXpos = (detstartOff' + detWavOffSec)./3600; %convert seconds back to hours
    
    
    
elseif strcmp(action,'stops')
    
    for iWin = 1:size(inWindowDet,1)
        winDetWavIdx{iWin} = find(PARAMS.ltsa.dnumStart<=inWindowDet(iWin,2)& inWindowDet(iWin,2)<=PARAMS.ltsa.dnumEnd);
        if isempty(winDetWavIdx{iWin})&& min(abs(PARAMS.ltsa.dnumStart-inWindowDet(iWin,2)))<tol %if nothing is found, check if two are actually equal but have very small difference
            [~,winDetWavIdx{iWin}] = min(abs(PARAMS.ltsa.dnumStart - inWindowDet(iWin,2)));
        end
        if size(winDetWavIdx{iWin},2)>1
            winDetWavIdx{iWin} = winDetWavIdx{iWin}(1);
            disp('WARNING! Detection end time found in two raw files!')
        end
    end
    
    wDWIdx = [winDetWavIdx{:}];
    winDetWavs = PARAMS.ltsa.dnumStart(wDWIdx)';
    detstartOff = (wDWIdx - (plotStart+1)).*rfDur + startPad; %find offset of raw file from start of LTSA
    detWavOff = inWindowDet(:,2) - winDetWavs;
    detWavOffSec = lt_convertDatenum(detWavOff,'seconds');
    detXpos = (detstartOff' + detWavOffSec)./3600; %convert seconds back to hours
    
else
    disp('WARNING! Action not registered. Available options are starts or stops')
end


