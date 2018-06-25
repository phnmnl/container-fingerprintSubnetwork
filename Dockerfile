#Dockerfile to compute network distance
#
#Author: M. Chazalviel & E. Camenen
#
#Copyright: PhenoMeNal/INRA Toulouse 2018

FROM java:8

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

ENV TAG_NUMBER 1.1

LABEL Description="Calculates distance between metabolites in a network."
LABEL software.version=1.1
LABEL version=1.3
LABEL software="FingerprintSubnetwork"
LABEL website="metexplore.toulouse.inra.fr"
LABEL tags="Metabolomics"

RUN apt-get update && apt-get install -y --no-install-recommends maven && \
	git clone --depth 1 --single-branch --branch $TAG_NUMBER https://github.com/MetExplore/computeDistanceMatrix.git Javafiles && \
	cd Javafiles && \
	git checkout $TAG_NUMBER && \
	cp -r data/ / && \
	mvn install:install-file install:install-file -Dfile=met4j-toolbox-0.1-distance.jar -DgroupId=fr.inra.toulouse.metexplore -DartifactId=met4j-toolbox -Dversion=0.1-distance -Dpackaging=jar && \
	mvn install && \
	apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*  && \
	mv /root/.m2/repository/fr/inra/toulouse/metexplore/FingerprintSubnetwork/$TAG_NUMBER/FingerprintSubnetwork-$TAG_NUMBER-jar-with-dependencies.jar /fingerprintSubnetwork.jar && \
	cd / && rm -rf Javafiles


ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runTest1.sh

ENTRYPOINT ["java", "-jar", "fingerprintSubnetwork.jar", "-network", "p1", "-fingerprint", "p2", "-atommapping", "p3"]