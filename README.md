# RATh2o2_dma3

1. To reproduce the in vitro arsenic simulations in ``A Computational Model of Endogenous Hydrogen Peroxide Metabolism in Hepatocytes, Featuring a Critical Role for GSH," run the Matlab
script RATh2o2_dma3.m. All other .m files (which calculate reaction and transport velocities) in this repository are called by this master script should be stored in the same directory/folder as it.

2. If you are not interested in the arsenic application, and just want access to the in vitro computational model of endogenous H2O2 metabolism in rat hepatocytes, please see the repository RATh2o2. 

3. If you wish to conjoin the in vitro computational model of endogenous H2O2 metabolism in rat hepatocytes to an in vitro PK/TK model for another ROS-generating xenobiotic to create a new PBPK/PD model, please note the following.

                       PRELIMINARIES:
   
                     * NAC/no-NAC in vitro cell survival data sets analogous to those collected by Naranmandura et al. for DMA3 must be available.
                     * An in vitro PK/TK model for the xenobiotic in rat hepatocytes must be available. Note that this will probably have to be modified in light of the values of
                       vmed (volume of medium) and cellnum (initial number of hepatocytes). 
                     * Rename RATh2o2_dma3.m to RATh2o2_(xenobiotic name).m and modify the code so that it does for your xenobiotic what was done here for DMA3/DMA5. PK/TK equations
                       should be defined beginning at equation 100. The equations before this describe constitutive hepatocyte metabolism. If the xenobiotic targets extramitochondrial
                       organelles (as does DMA3), its variable should appear in equation 32 (H2O2 in cytoplasm). If it targets mitochondria, its variable should appear in equation 21
                       (H2O2 in mitochondria). If you are uncertain, putting it in equation 32 provides a reasonable approximation since there is GSH transport between mitochondria
                       and cytoplasm. In the code, Naranmandura's DMA3 cell survival data sets should be replaced with analogous data sets for your xenobiotic.
                     
                     

                       WORKFLOW:

                       1. Simulate pre-culturing of cells by running RATh2o2.m, found in the RATh2o2 repository. In my paper, the pre-culturing period was 24 hours in duration (t=-24 to t=0)
                       since this is what was used in Naranmandura's experiments. For the control cells, use yinit (stored in yinitialcondition.mat in the RATh2o2 repository) as the initial
                       condition, and store the result in a file named yinitialcondition(xenobiotic name)nonac.mat. Now do this again, but with yinit(11) changed to reflect the addition
                       of NAC supplementation (2,000 microM in my paper). Store the result in a file called yinitialcondition(xenobiotic name)nac.mat. These .mat files should take the
                       place of yinitialconditionarsenicnonac.mat and yinitialconditionarsenicnac.mat in RATh2o2_(xenobiotic name).m. 

    
                       2. Run RATh2o2_(xenobiotic name).m., generating the analogue to Fig. 2 in my paper. Vary the function dictating the relationship between excess rate of H2O2 production
                       and intracellular xenobiotic concentration until optimal agreement is obtained.

                       3. You now have an in vitro PBPK/PD model for the ROS-generating xenobiotic which predicts intracellular H2O2 concentration, GSH level, GSH:GSSG ratio, and hepatocyte death.

