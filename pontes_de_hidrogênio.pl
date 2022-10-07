open(ENTRADA,"<CALCULO.txt");

open(SAIDA,">>PONTE.txt");


	my @vetor_ponte01;
	my @vetor_atomo01;
	my @vetor_atomo02;
	my @vetor_atomo03;
	my @vetor_hetatm01;
	my @vetor_hetatm02;
	my @vetor_hetatm03;
	my $minimo=3.5;
	my $i=0;
	
	
#Distancia Euclidiana = 25.7867534598677 Atomo = 29.361 39.686 5.862 Hetatm = 9.280 23.763 3.004


while (my $line = <ENTRADA>)
{

	
	if ($line =~ /(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
		
		
		@vetor_ponte01[$i] = $7;
		@vetor_atomo01[$i] = $13;
	    @vetor_atomo02[$i] = $15;
	    @vetor_atomo03[$i] = $17;
	    @vetor_hetatm01[$i] = $23;
	    @vetor_hetatm02[$i] = $25;
	    @vetor_hetatm03[$i] = $27;
		
		if(@vetor_ponte01[$i] < $minimo)
		{
		$minimo = @vetor_ponte01[$i];
		
		print SAIDA "Distacia Euclidiana < 3.5 = @vetor_ponte01[$i] Atomo = @vetor_atomo01[$i] @vetor_atomo02[$i] @vetor_atomo03[$i] Hetatm = @vetor_hetatm01[$i] @vetor_hetatm02[$i] @vetor_hetatm03[$i]\n";
		}
		$i++;
	}
	
}
