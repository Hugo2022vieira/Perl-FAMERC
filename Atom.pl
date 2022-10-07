open(ENTRADA,"<1HSG.pdb");

open(SAIDA_ATOM,">>SAIDA_ATOM.txt");


while (my $line = <ENTRADA>)
{

	
	if ($line =~ /(ATOM)/)
	{
		
		print Exe_Func"$1\n";
	}
}

