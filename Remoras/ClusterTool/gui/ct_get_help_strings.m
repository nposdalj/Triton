function ctHelpStrings = ct_get_help_strings

%%% Clustering parameter choices %%%
ctHelpStrings.siteName = 'First few letters of TPWS file names to be read. Optional.';

ctHelpStrings.minClust = ['Minimum number of clicks required for a cluster to be retained.\n', ... 
 'Think about how fast your species click(s), group sizes,\nand how many clicks ',... 
 'they make per N minutes.'];
 
ctHelpStrings.pruneThr = ['Percentage of edges between nodes that you want to prune.\n ',...
'Pruning speeds up clustering and affects separation of types,\n',...
'but can result in isolation (therefore exclusion) of rare click types.'];

ctHelpStrings.variableThreshold = ['If FALSE, all edges weaker than this threshold ',...
    'are removed from graph. \nIf TRUE, value is interpreted as percentage of weakest edges',...
    ' to be removed from graph.'];

ctHelpStrings.useSpectra = ['If TRUE, correlation distance between spectra will be used ,',...
    'to compute detection similarities.\n You can cluster on spectra only, waveform only, or both.'];

ctHelpStrings.useEnvelope = ['If TRUE, correlation distance between waveform envelopes will be used to compute detection similarities.'];

ctHelpStrings.normalizeTF = ['If TRUE, each spectrum and waveform is normalized on [0,1] scale.'];

ctHelpStrings.maxCWiterations = 'Maximum number of clustering iterations allowed per bin.';

ctHelpStrings.mergeTF = ['If TRUE when a graph is large, we will attempt to reduce ',...
    'computation time\n by merging extremely similar nodes before clustering.'];

ctHelpStrings.linearTF = ['If TRUE, compare spectra in linear space,\n',...
    'otherwise compares in log (dB) scale.'];

ctHelpStrings.plotFlag = ['If TRUE, plots will be shown for each clustered bin.\n'...
    'Turn this off for large jobs, but useful for seeing how your\n',...
    'clusters are coming out when choosing parameters.\n',...
    'Plotting is not available when parpool size > 1.'];

ctHelpStrings.falseRM = ['If TRUE, tool will check for FD file from detEdit and ',...
    'remove labeled false positives. \nOtherwise all detections in TPWS files ',...
    'will be used as clustering input.'];

ctHelpStrings.barIntMax = '';%ICI bins in seconds (minICI:resolution:maxICI)

ctHelpStrings.diff = 'If TRUE, compare first derivative of spectra instead of original values.';

ctHelpStrings.ppThresh = ['If specified, enforces a minimum recieved level in ',...
    'dB peak to peak,\n and only clusters higher amplitude events, ', ...
    'which tend to have cleaner spectra.'];
 
ctHelpStrings.timeStep = ['Bin duration in minutes. \nDetections are ',...
    'clustered by time bin. How long of a time bin do you want to consider?\n',...
    'Larger bins -> more detections, better representation for slow cue rate sources.\n',...
    'However large time bins mean more detection counts -> longer computation ',... 
    'times,\n or subsampling when detections accumulate rapidly in time.'];

ctHelpStrings.maxNetworkSz = ['Maximum number of detections allowed in a network.\n',...
'If there are more detections in a time bin than this number, a random subset\n',...
'will be selected for clustering. Your computer will need to handle\n',...
'maxNetworkSz^2 edges, so more RAM allows larger networks. '];

ctHelpStrings.minCueGap = 'Minimum gap between clicks in seconds. Can help exclude buzzes.';

%p.diary = 0; % If 1, turn on diary logging of console output. Warning: Files can get large.

ctHelpStrings.parpoolSize = ['Number of parallel workers to use. \nChoose ',... 
    'this carefully based on your computer''s capabilities. If >1, ',...
    'plots will not be made during operation.'];

ctHelpStrings.freqs = ['Range of frequencies you want to compare clicks across:\n',...
    'Comparing across the full bandwidth tends to reduce differences between \n',...
    'spectra. Results are typically better if you focus on comparing the region\n',...
    'where spectra differ most.\n',...
    'If your spectra roll off at the edges, use start and end freq to \n',...
    'exclude those regions. Including roll-off will reduce overall \nspectral differences.'];

