
% 
%  A sample MATLAB code to use Stan model for BACIQ 
% 
rootPath = '/Users/pes/';             % your home folder
addpath(genpath([rootPath 'matlab/MatlabProcessManager-master']), '-end')   % path to Stan MATLAB installation
addpath(genpath([rootPath 'matlab/MatlabStan-2.7.0.0']), '-end') 
path.code = [rootPath 'Research/MassSpec/dirichlet/code/'];               % path to Stan model
P.modelFile = [path.code 'DM.stan'];                                          % path and Stan model file 
model = StanModel('file', P.modelFile); 
model.compile(); 
D = [205.8 411.7 1.1 14897.1;   
      50.7376 44.25 464.6 486.1;
      49.10 27.07 3177.4 2642.4;   
      1.1 1.1 321.45 245.1;
      20.22 15.02 352.6 435.5;   
      34.01 23.51 1877.35 2002.46;
      5.41 3.02 618.1 736.4;   
      7.0 8.2 1391.19 1697.05;   
      1.1 1.1 470.2 563.3];  
peps_dat = struct('K',  size(D,2),  'y', round(D), 'N',  size(D,1)); 
fitM = model.sampling( 'data', peps_dat, 'iter',  1000, 'warmup', 100, 'chains', 1)
sim = extract(fitM); 
Median_Probability = quantile(sim.mu, .5 );      % get the median, or change to any quantile to get CI out 

