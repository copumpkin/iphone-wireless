#*******************************************************************************
#* iPhone-Wireless Project : Telephony Library                                 *
#* Copyright (C) 2007      Geohot <geohot@gmail.com>                           *
#* Copyright (C) 2007-2008 Pumpkin <pumpkingod@gmail.com>                      *
#* Copyright (C) 2007-2008 Lokkju <lokkju@gmail.com>                           *
#*******************************************************************************
#* $LastChangedDate$ *
#* $LastChangedBy$ *
#* $LastChangedRevision$ *
#* $Id$ *
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
CC=arm-apple-darwin-cc 
LD=arm-apple-darwin-cc 
LDFLAGS=-ObjC -framework CoreFoundation -framework Foundation -framework CoreTelephony

%.o:    %.m %.h %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

all:    cellstumbler

cellstumbler:   main.c
	$(LD) $(LDFLAGS) -o $@ $^

clean : 
	rm -f *.o
	rm -f cellstumbler

