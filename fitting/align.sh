
psf="../mnpp_apoX_nwt.psf"
ref="../mnpp_apoX_nwt.pdb"
ind="CV.ind"
bin1="/home/hoge/develop/md_analysis/src/d_trj_fitting.x"
bin2="/home/hoge/develop/md_analysis/src/d_trj_ave.x"
tgt="mnpp_apoX_fitCV.nwt"

$bin1 $psf $tgt.dcd $ref $ind yes > $tgt.rmsd1
mv -v outdcd $tgt.1.dcd
$bin2 $psf $tgt.1.dcd $tgt.1.ave.pdb

for i in `seq 1 3`;do
	$bin1 $psf $tgt.$i.dcd $ref $ind yes > $tgt.rmsd`expr $i + 1`
	mv -v outdcd $tgt.`expr $i + 1`.dcd
	$bin2 $psf $tgt.`expr $i + 1`.dcd $tgt.`expr $i + 1`.ave.pdb
done
