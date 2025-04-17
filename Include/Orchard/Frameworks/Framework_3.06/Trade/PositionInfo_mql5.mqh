/*
   PositionInfo_mql5.mqh
   Framework 3.01

   Copyright 2013-2022, Orchard Forex
   https://www.orchardforex.com

*/

/**=
 *
 * Disclaimer and Licence
 *
 * This file is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * All trading involves risk. You should have received the risk warnings
 * and terms of use in the README.MD file distributed with this software.
 * See the README.MD file for more information and before using this software.
 *
 **/

#include <Trade/PositionInfo.mqh>

class CPositionInfoCustom : public CPositionInfo {

public:
   int Total() { return ( PositionsTotal() ); }
   int Count( const string symbol, int magic_number );
};

int CPositionInfoCustom::Count( const string symbol, int magic_number  ) {
   CPositionInfo positionInfo; // Create an instance of CPositionInfo
   int positionCount = 0; // Counter for positions on the current symbol
   // Loop through all open positions
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      // Select position by index
      ulong ticket = PositionGetTicket(i);
      if(positionInfo.SelectByTicket(ticket))
      {
         // Check if the position is for the current symbol
         if(positionInfo.Symbol() == symbol && positionInfo.Magic() == magic_number)
         {
            positionCount++;
         }
      }
   }
   return (positionCount);
};
