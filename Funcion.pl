open(ENTRADA,"<1HSG.pdb");

open(SAIDA_FUNC,">>SAIDA_FUNC.txt");


while (my $line = <ENTRADA>)
{

	
	if ($line =~ /(FUNC)/)
	{
		
		print Exe_func"$1\n";
	}
}

