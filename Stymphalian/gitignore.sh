# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gitignore.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phtruong <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/05 10:42:22 by phtruong          #+#    #+#              #
#    Updated: 2019/06/19 15:50:35 by phtruong         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' #no color

if [ "$#" -ne 1 ] ; then
	echo -e "${RED}usage:${NC} sh $0 ${CYAN}dir_path"
else
	DIR=$1
	GIT=$DIR/.gitignore
	echo "# Prerequisites\n*.d\n" > $GIT
	echo "# Object Files\n*.o\n*.ko\n*.obj\n*.elf\n" >> $GIT
	echo "# Linker output\n*.ilk\n*.map\n*.exp\n" >> $GIT
	echo "# Precompiled Headers\n*.gch\n*.pch\n" >> $GIT
	echo "# Libraries\n*.lib\n*.a\n*.la\n*.lo\n" >> $GIT
	echo "# Shared objects (inc. Windows DLLS)\n*.dll\n*.so\n*.so.*\n*.dylib\n" >> $GIT
	echo "# Executables\n*.exe\n*.out\n*.app\n*.i*86\n*.x86_64\n*.hex\n" >> $GIT
	echo "# Debug files\n*.dSYM/\n*.su\n*.idb\n*.pdb\n" >> $GIT
	echo "# Kernel Module Compile Results\n*.mod*\n*.cmd\n.tmp_verions/\nmodules.order\nModule.symvers\nMkfile.old\ndkms.conf\n" >> $GIT
	echo "# Temp files\n*.DS_Store\n*._*\n*.*.swp" >> $GIT
fi
	exit 0

