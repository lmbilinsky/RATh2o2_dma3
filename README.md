# RATh2o2_dma3

1. To reproduce the in vitro arsenic simulations in ``A Computational Model of Endogenous Hydrogen Peroxide Metabolism in Hepatocytes, Featuring a Critical Role for GSH," run the Matlab
script RATh2o2_dma3.m. All other .m files in this repository are called by this master script, and calculate transport and reaction velocities. All files in this repository should be stored in the same directory/folder.

2. If you are not interested in the arsenic application, and just want access to the in vitro computational model of endogenous H2O2 metabolism in rat hepatocytes, please see the repository RATh2o2. 

3. If you wish to conjoin the in vitro computational model of endogenous H2O2 metabolism in rat hepatocytes to an in vitro PK/TK model for another ROS-generating xenobiotic, please note the following.

                       FIRST:
   
                     * NAC/no-NAC in vitro cell survival data sets analogous to those collected by Naranmandura et al. for DMA3 must be available.
                     * An in vitro PK/TK model for the xenobiotic in rat hepatocytes must be available. Note that this will probably have to be modified in light of the values of
                       vmed (volume of medium) and cellnum (initial number of hepatocytes). To see how to do this, please see the Supplementary Material of my paper.
                     * Rename RATh2o2_dma3.m to RATh2o2_(xenobiotic name).m and modify the code so that it does for your xenobiotic what was done here for DMA3/DMA5. PK/TK equations
                       should be defined beginning at equation 100. The equations before this describe constitutive hepatocyte metabolism. If the xenobiotic targets extramitochondrial
                       organelles (as does DMA3), its variable should appear in equation 32 (H2O2 in cytoplasm). If it targets mitochondria, its variable should appear in equation 21
                       (H2O2 in mitochondria). If you are uncertain or it targets both, putting it in equation 32 provides a reasonable approximation. Naranmandura's DMA3 cell survival
                       data sets should be replaced with analogous data sets for your xenobiotic.
                     * The constants vmed (volume of medium) and cellnum (initial number of hepatocytes, here set to 20,000) in RATh2o2_(xenobiotic name).m should probably be changed.
                       These should correspond to the experimental set-up used to generate the NAC/no-NAC in vitro cell survival data sets.
                     

                       WORKFLOW:

                       1. The .mat file yinitialcondition.mat contains the variable yinit, which defines the initial state of the system at the beginning of the 24-hour pre-culturing period
                       (t=-24 hours in the paper's figures). Element 65 of yinit should be set to the initial number of hepatocytes. Element 10 of yinit should be set to the initial
                       concentration of cystine in medium and element 11 should be set to the initial concentration of cysteine in medium. The default values are ones I estimated for
                       Dulbecco's Modified Eagle Medium (see paper). If the experimental setup used to generate the NAC/no-NAC data sets uses a different medium formula, different values
                       may be needed.

                       Using yinit (possibly modified as described above) as the initial condition, simulate pre-culturing of the control cells by running RATh2o2.m (see RATh2o2 repository).
                       In the paper, the pre-culturing period was 24 hours in duration (t=-24 to t=0). This may need to be changed, depending on the experimental set-up. Save the output in a .mat
                       file called `yinitialcondition(xenobiotic name)nonac.mat.' This is the analogue to yinitialconditionarsenicnonac.mat.

                       Then, redo the above, this time adding 2,000 (or whatever amount of NAC supplementation was used, in units of micromolar) to element 11 of yinit. Store the output in
                       a file called yinitialcondition(xenobiotic name)nac.mat. This is the analogue to yinitialconditionarsenicnac.mat. 

                       Replace yinitialconditionarsenicnonac.mat and yinitialconditionarsenicnac.mat in RATh2o2_(xenobiotic name).m with the two analogous .mat files created here.
    
                       2. Run RATh2o2_(xenobiotic name).m and look at the figure containing the experimental data on NAC/no-NAC cell survival that you are trying to fit. Vary the functional
                          dependence of the rate of excess H2O2 production on intracellular xenobiotic concentration (equation 32 or 21) until optimal agreement is obtained between your
                          model and the experimental data.

                       3. You now have an in vitro PBPK/PD model for the ROS-generating xenobiotic which predicts intracellular H2O2 concentration, GSH level, GSH:GSSG ratio, and hepatocyte death.

