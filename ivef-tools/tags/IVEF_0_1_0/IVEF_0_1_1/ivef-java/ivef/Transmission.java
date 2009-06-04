/* 
 *  Transmission
 *
 *  Transmission is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  Foobar is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY ); without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 **********************************************************************************
 *  WARNING: THIS CODE WAS GENERATED DO NOT MODIFY, CHANGE THE XSD INSTEAD
 *  Generated by xsd2code on Wed May 20 17:30:51 2009.
 **********************************************************************************
 *  Copyright 2008
 *
 */

package ivef;

import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


public class Transmission { 

    private int m_type; // default value is uninitialized
    private double m_period; // default value is uninitialized
    private boolean m_periodPresent;

    public Transmission() {

        m_periodPresent = false;
    }

    public Transmission(Transmission val) {

        m_type = val.getType();
        m_periodPresent = val.hasPeriod();
        m_period = val.getPeriod();
    }

    public void setType(int val) {

        if ( ( val != 1 ) &&
             ( val != 2 ) &&
             ( val != 3 ) &&
             ( val != 4 ) )
            return;
        m_type = val;
    }

    public int getType() {

        return m_type;
    }

    public void setPeriod(double val) {

        m_periodPresent = true;
        m_period = val;
    }

    public double getPeriod() {

        return m_period;
    }

    public boolean hasPeriod() {

        return m_periodPresent;
    }

    public String toXML() {

        String xml = "<Transmission";
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss.SSS");

        xml += " Type=\"" + m_type + "\"";
        if ( hasPeriod() ) {
            xml += " Period=\"" + m_period + "\"";
        }
        xml += ">\n";
        xml += "</Transmission>\n";
        return xml;
    }

    public String toString(String lead) {

        String str = lead + "Transmission\n";
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss.SSS");

        str +=  lead + "    Type = " + m_type + "\n";
        if ( hasPeriod() ) {
            str +=  lead + "    Period = " + m_period + "\n";
        }
        return str;
    }
    public String encode( String str) {

        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }


}
