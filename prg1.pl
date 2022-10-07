open(ENTRADA,"<1HSG.pdb");

open(SAIDA,">>SAIDA.txt");

	my @vetor1;
	my @vetor2;
	my $i=0;
	
	
#ATOM     18  CA  ILE A   3      29.123  33.098   3.397  1.00 34.13           C  


while (my $line = <ENTRADA>)
{

	
	if ($line =~ /(ATOM+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
		
		#print SAIDA "$1$2$3$4$5$6$7$8$9$10$11$12$13$14$15$16$17$18$19$20$21$22$23\n";
		@vetor1[$i] = $1;
		@vetor2[$i] = $3;
		 unshift(@vetor1,$i);
		#print SAIDA " @vetor1[$i] @vetor2[$i] \n" ;
		print "@vetor1\n";
		$i++;
	}
}



#print scalar(#$vetor1);