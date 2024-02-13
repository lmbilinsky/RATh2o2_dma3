# RATh2o2_dma3

1. To reproduce the in vitro arsenic simulations in ``A Computational Model of Endogenous Hydrogen Peroxide Metabolism in Hepatocytes, Featuring a Critical Role for GSH," run the Matlab
script RATh2o2_dma3.m. All other .m files in this repository are called by this master script, and calculate transport and reaction velocities. All files in this repository should be stored in the same directory/folder.

2. If you are not interested in the arsenic application, and just want access to the in vitro computational model of endogenous H2O2 metabolism in rat hepatocytes, please see the repository RATh2o2. 

3. If you wish to conjoin the in vitro computational model of endogenous H2O2 metabolism in rat hepatocytes to an in vitro PK/TK model for another ROS-generating xenobiotic, please note the following.

                     * NAC/no-NAC in vitro cell survival data sets analogous to those collected by Naranmandura et al. for DMA3 must be available.
                     * An in vitro PK/TK model for the xenobiotic in rat hepatocytes must be available.
                     * Rename RATh2o2_dma3.m to RATh2o2_(xenobiotic name).m and modify the code so that it does for your xenobiotic what was done here for DMA3/DMA5. PK/TK equations
                       should be defined beginning at equation 100. If the xenobiotic targets extramitochondrial organelles (as does DMA3), its variable should appear in equation 32
                       (H2O2 in cytoplasm). If it targets mitochondria, its variable should appear in equation 21 (H2O2 in mitochondria). If you are uncertain or it targets both, putting                        it in equation 32 provides a reasonable approximation.
                     * the constants vmed (volume of medium) and cellnum (initial number of hepatocytes, here set to 20,000) in RATh2o2.m should probably be changed. 


Also, depending on the particular medium formula used, the initial concentrations of cystine and cysteine in medium (elements 10 and 11 of yinitialconditionarsenicnonac.mat) may need to be changed in the analogous .mat file, which defines the initial 


and how much additional NAC supplementation is given (when simulating NAC/no-NAC experiments analogous to Naranmandura's 2011 experiments), the initial concentrations of cystine and cysteine in medium, corresopnding to components 10 and 11 of the initial conditions stored in the .mat files


