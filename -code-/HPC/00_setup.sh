# Open your Terminal (Mac) or PuTTy (Windows)
ssh USER@idiv-gateway.ufz.de
# [enter your password]
ssh frontend1
# [enter your password]

# This line will copy all of the files and directories to your own work space (the ~ symbol )
cp -r /public/ddRAD-seq_workshop/ /work/$USER/

# This code will make a ddRAD-seq_workshop folder inside a submit_scripts folder in your home directory (~/)
cd ~
mkdir /home/$USER/submit_scripts
mkdir /home/$USER/submit_scripts/ddRAD-seq_workshop

# This line will move scripts to your own submit_scripts directory
mv /work/$USER/ddRAD-seq_workshop/scripts /home/$USER/submit_scripts/ddRAD-seq_workshop/