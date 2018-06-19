![LOGO](Logo_Metexplore.png)
# FingerprintSubnetwork

Version: 1.2

## Short description
Calculates distance between metabolites in a network.

## Description
Calculates shortest paths between pairwise metabolites in a network from a fingerprint. The number of reactions separated two metabolites could take account to the reversibility of each reactions. Without this option, a path between metabolites could cross over several times through the same reactions. The biological network chosen by default is Recon v2.03 (Thiele et al., 2003)

## Key features
- Metabolic network
- Modeling

## Functionality
- Post-processing
- Statistical Analysis

## Tool Authors
- MetExplore Group contact-metexplore@inra.fr

## Container Contributors
- Maxime Chazalviel (INRA Toulouse)
- Etienne Camenen (INRA Toulouse)

## Git Repository
- https://github.com/MetExplore/container-computeDistanceMatrix.git

## Installation
For local installation of the container:
```
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/fingerprintsubnetwork
```

## Usage Instructions
For direct usage of the docker image:

```
docker run docker-registry.phenomenal-h2020.eu/phnmnl/fingerprintsubnetwork -fingerprint <input_file> -network <input_file> -atommapping <input_file> [-matrixresult <output_file>] [-reactionresult <output_file>] [-algo <algorithm_name>] [-h]
```

### Required  parameters
- ```-fingerprint``` :  a one-column file containing SBML identifiers These identifiers could be found for Recon v2.03 by using 'Metabolites' tabs from https://metexplore.toulouse.inra.fr/metexplore2/?idBioSource=3223.
- ```-network``` : a XML biological network file at SBML format (by default, Recon v2.0.3; Thiele et al., 2013)
- ```-atommapping``` : an atom mapping tabulated file with the reactive, the product and the reaction SBML identifiers and the weight of each reactions

### Facultative parameters 
- ```-matrixresult``` a tabulated file containing the distance matrix between pairwise metabolites The metabolites SBML identifiers are in the first column and there is no header.
- ```-reactionresult```: a json file containing a list of reactions associated with each metabolites into a network
- ```-algo```: a choice between two parameters: (i) an oriented algorithm (```-ValidShortest``` value, by default) where the path could cross only once through the same reaction and (ii) an un-oriented one (```-ShortestAsUndirected```) with an inverse pattern. The first produced more infinity distance than the second, but is more close to the biological reality. 
- ```-h``` display help

## References
- Thiele I., Swainston N., Fleming R.M.T., et al (2013). A community-driven global reconstruction of human metabolism (2013). Nature biotechnology 31(5):10. doi:10.1038/nbt.2488.
- Cottret, L., Frainay, C., Chazalviel, M., et al. (2018). MetExplore: collaborative edition and exploration of metabolic networks. Nucleic acids research, 1.