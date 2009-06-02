<?xml version="1.0" encoding="UTF-8"?>
<xs:stylesheet xmlns:xs="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	version="1.0">
<!--
XSD2OBJC
This XSLT transforms XSD files to Objective-C implementation file
Copyright (C) 2004  Pucky Loucks pucky[at]theloucks[dot]com

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  
USA

http://www.gnu.org/copyleft/lesser.html#SEC3

NOTE: you will need to change the name of the #import "genfile.h"
-->	
	<xs:output method="text"/>
<xs:variable name="namespace-prefix" select="'PL'"/>
<xs:variable name="lcletters">abcdefghijklmnopqrstuvwxyz</xs:variable>
<xs:variable name="ucletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xs:variable>
<xs:template match="/">

<![CDATA[//The Following File was generated with XSD2OBJC Copyright (C) 
2004  Pucky Loucks pucky[at]theloucks[dot]com]]>
<![CDATA[#import <Cocoa/Cocoa.h>]]>
<![CDATA[#import "ccm.h"]]>
<xs:for-each select="//xsd:element[@name]/xsd:complexType">

		<xs:call-template name="implementation"/>

</xs:for-each>

</xs:template>
	
<xs:template name="implementation">
<xs:if test="not(./@type)">
@implementation  <xs:value-of select="$namespace-prefix"/><xs:value-of 
select="../@name"/> : <![CDATA[NSObject]]>

<xs:for-each select="./*/xsd:element">
	<xs:call-template name="method"/>
</xs:for-each>
<xs:for-each select="./*/*/xsd:element">
	<xs:call-template name="method"/>
</xs:for-each>
@end	
</xs:if>
<xs:for-each select="./*/*/xsd:element">
	<xs:if test="../@name">
			<xs:call-template name="implementation"/>
	</xs:if>
</xs:for-each>
<xs:for-each select="./*/*/*/xsd:element">
	<xs:if test="../@name">
			<xs:call-template name="implementation"/>
	</xs:if>
</xs:for-each>
</xs:template>

<xs:template name="method">
<xs:if test="not(@maxOccurs) and not(@type) and not(@ref)">
-(id)<xs:call-template name="convert-method"><xs:with-param 
name='toconvert' select="@name"/></xs:call-template>
{
	return _<xs:value-of select="@name"/>;
}
-(void)set<xs:value-of select="@name"/>:(id)new<xs:value-of 
select="@name"/>
{
	[new<xs:value-of select="@name"/> retain];
	[_<xs:value-of select="@name"/> release];
	_<xs:value-of select="@name"/> = new<xs:value-of select="@name"/>;
}
</xs:if>
<xs:if test="not(@maxOccurs) and not(@type) and @ref">
-(id)<xs:call-template name="convert-method"><xs:with-param 
name='toconvert' select="@ref"/></xs:call-template>
{
	return _<xs:value-of select="@ref"/>;
}
-(void)set<xs:value-of select="@ref"/>:(id)new<xs:value-of 
select="@ref"/>
{
	[new<xs:value-of select="@ref"/> retain];
	[_<xs:value-of select="@ref"/> release];
	_<xs:value-of select="@ref"/> = new<xs:value-of select="@ref"/>;
}
</xs:if>
<xs:if test="@maxOccurs and @ref">
-(NSMutableArray *)<xs:call-template 
name="convert-method"><xs:with-param name='toconvert' 
select="@ref"/></xs:call-template>
{
	return _<xs:value-of select="@ref"/>;
}
-(void)set<xs:value-of select="@ref"/>:(NSMutableArray 
*)new<xs:value-of select="@ref"/>
{
	[new<xs:value-of select="@ref"/> retain];
	[_<xs:value-of select="@ref"/> release];
	_<xs:value-of select="@ref"/> = new<xs:value-of select="@ref"/>;
}
</xs:if>
<xs:if test="@maxOccurs and not(@ref)">
-(NSMutableArray *)<xs:call-template 
name="convert-method"><xs:with-param name='toconvert' 
select="@name"/></xs:call-template>
{
	return _<xs:value-of select="@name"/>;
}
-(void)set<xs:value-of select="@name"/>:(NSMutableArray 
*)new<xs:value-of select="@name"/>
{
	[new<xs:value-of select="@name"/> retain];
	[_<xs:value-of select="@name"/> release];
	_<xs:value-of select="@name"/> = new<xs:value-of select="@name"/>;
}
</xs:if>
<xs:if test="not(@maxOccurs)">
	<xs:for-each select=".">
		<xs:if test="contains(@type,'string')">
-(NSString *)<xs:call-template name="convert-method"><xs:with-param 
name='toconvert' select="@name"/></xs:call-template>
{
	return _<xs:value-of select="@name"/>;
}
-(void)set<xs:value-of select="@name"/>:(NSString *)new<xs:value-of 
select="@name"/>
{
	[new<xs:value-of select="@name"/> retain];
	[_<xs:value-of select="@name"/> release];
	_<xs:value-of select="@name"/> = new<xs:value-of select="@name"/>;
}
		</xs:if>
		<xs:if test="contains(@type,'int')">
-(NSNumber *)<xs:call-template name="convert-method"><xs:with-param 
name='toconvert' select="@name"/></xs:call-template>
{
	return _<xs:value-of select="@name"/>;
}
-(void)set<xs:value-of select="@name"/>:(NSNumber *)new<xs:value-of 
select="@name"/>
{
	[new<xs:value-of select="@name"/> retain];
	[_<xs:value-of select="@name"/> release];
	_<xs:value-of select="@name"/> = new<xs:value-of select="@name"/>;
}
		</xs:if>
		<xs:if test="contains(@type,'boolean')">
-(BOOL)<xs:call-template name="convert-method"><xs:with-param 
name='toconvert' select="@name"/></xs:call-template>
{
	return _<xs:value-of select="@name"/>;
}
-(void)set<xs:value-of select="@name"/>:(BOOL)new<xs:value-of 
select="@name"/>
{
	<!--[new<xs:value-of select="@name"/> retain];
	[_<xs:value-of select="@name"/> release];-->
	_<xs:value-of select="@name"/> = new<xs:value-of select="@name"/>;
}
		</xs:if>
	</xs:for-each>	
</xs:if>
</xs:template>

<xs:template name="convert-method">
     <xs:param name='toconvert' />
	<xs:value-of 
select="translate(substring($toconvert,1,1),$ucletters,$lcletters)" 
/><xs:value-of 
select="substring($toconvert,2,string-length($toconvert))"/>
  </xs:template>
</xs:stylesheet>
