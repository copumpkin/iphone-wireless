#*******************************************************************************
#* iPhone-Wireless Project : Stumbler                                          *
#* Copyright (C) 2007-2008 Pumpkin <pumpkingod@gmail.com>                      *
#* Copyright (C) 2007-2008 Lokkju <lokkju@gmail.com>                           *
#*******************************************************************************
#* $LastChangedDate::                                                        $ *
#* $LastChangedBy::                                                          $ *
#* $LastChangedRevision::                                                    $ *
#* $Id::                                                                     $ *
#*******************************************************************************
#*  This program is free software: you can redistribute it and/or modify       *
#*  it under the terms of the GNU General Public License as published by       *
#*  the Free Software Foundation, either version 3 of the License, or          *
#*  (at your option) any later version.                                        *
#*                                                                             *
#*  This program is distributed in the hope that it will be useful,            *
#*  but WITHOUT ANY WARRANTY; without even the implied warranty of             *
#*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              *
#*  GNU General Public License for more details.                               *
#*                                                                             *
#*  You should have received a copy of the GNU General Public License          *
#*  along with this program.  If not, see <http://www.gnu.org/licenses/>.      *
#*******************************************************************************

# $HeadURL$
# TARGET should be your iphone's ip.  I use /etc/hosts to link iphone to the ip
TARGET=iphone
NAME=Stumbler
USER=root
VERSION=`cat ../VERSION`
scp -q -p -r ./$NAME.app $USER@$TARGET:/Applications/$NAME-$VERSION.app

