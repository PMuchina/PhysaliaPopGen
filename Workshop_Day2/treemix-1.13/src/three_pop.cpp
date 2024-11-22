/*
 * three_pop.cpp
 *
 *  Created on: Nov 9, 2011
 *      Author: pickrell
 */






#include "GraphState2.h"
#include "PhyloPop_params.h"
#include "CmdLine.h"


void printopts(){
	cout << "\nthreepop v. 0.1\n";
	cout << "Options:\n";
	cout << "-i [file name] input file\n";
	cout << "-k [int] number of SNPs per block for estimation of standard errors (1)\n";
	cout << "\n";
}

string infile;
int main(int argc, char *argv[])
{
	PhyloPop_params p;
    CCmdLine cmdline;
	if (cmdline.SplitLine(argc, argv) < 1){
		printopts();
		exit(1);
	}
    if (cmdline.HasSwitch("-i")) infile = cmdline.GetArgument("-i", 0).c_str();
    else{
     	printopts();
     	exit(1);
    }
    if (cmdline.HasSwitch("-k"))	p.window_size = atoi(cmdline.GetArgument("-k", 0).c_str());
	CountData counts(infile.c_str(), &p);
	for (int i = 0; i < counts.npop; i++){
		for (int j = i+1; j < counts.npop; j++){
			for (int k = j+1; k < counts.npop; k++){
				set<pair<string, pair<double, double> > >  f3 = counts.calculate_f3(i, j, k);
				for (set<pair<string, pair<double, double> > >::iterator it = f3.begin(); it != f3.end(); it++){
					cout << it->first << " "<< it->second.first << " "<< it->second.second << " "<< it->second.first/ it->second.second  << "\n";
				}
			}
		}
	}

	return 0;
}

