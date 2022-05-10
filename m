Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B05E523DA2
	for <lists+squashfs-devel@lfdr.de>; Wed, 11 May 2022 21:35:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nos7O-00072P-KC; Wed, 11 May 2022 19:35:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sxwjean@gmail.com>) id 1noPlo-0004bv-A9
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 13:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sh6ZfehXLaJ7xf8De4B54CxjZg1Ny7yY0hSdnd+MRLg=; b=VEPEoy2ZwgQ+YFkK9S2AvkQkeT
 dazb2MIO75VUNfl4LW8Kl3FDYAMMuYsFUqtDIJ3btPQkdZ7d97F/+iiKbsglPU2Tm9tJgfWdfI1ap
 cGgD5c08+vGMvPYocQ3LcqmeOxZK87YyYFQUC9Ul+/iLBN4QzNV5P6WKyCUP2XXkJ9q4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sh6ZfehXLaJ7xf8De4B54CxjZg1Ny7yY0hSdnd+MRLg=; b=kC733E3nEVySxhBot/v/2qGj3a
 fkg5iPItJSge76i1soFKs2Q7ePoVKfdzWYka5Wx3oqa6ZYyJSJCgwG9zBX4SEYr9OQ3x42HiBaiuM
 7jarHsvN+B0A6nisRU/S0fa3httAl2/VJ2h2iWAmcaStWXVvjBA8T0gYzvgShDa4Bs6c=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1noPlk-0000hp-SE
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 13:19:18 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso2113811pjb.5
 for <squashfs-devel@lists.sourceforge.net>;
 Tue, 10 May 2022 06:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sh6ZfehXLaJ7xf8De4B54CxjZg1Ny7yY0hSdnd+MRLg=;
 b=Nn2Kn6HF1IGXiegiEP//KKeoQ3a5gEDosit+4aD15YZU7J8VKyPLtB8f0ADZ84uXxm
 uKUhFaM6otQVHlBMUGiFLo69B8ELex8xqVCK/AEgZbHjgy0IXvlrWm/AkkH+6e9yOmjr
 vU03hklOK6Hk59iOgL0T4GvQy/ry1yizkfp83ACT9mP4Y/fayzlObYCrVI0dHNIqt5px
 0+tAlOR3lJOGH78HHrS5XY9AjEq0meuE9RuQKfqGwVR1DH6ARWZ7MzBMP3TIQq7kS9Q0
 HC9vFfbKYgDvClFxV9tVgFLdwdEhB6Yyd68/SXbZjol82aEeisjM4ijyXAQcKqWr5WPN
 xOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sh6ZfehXLaJ7xf8De4B54CxjZg1Ny7yY0hSdnd+MRLg=;
 b=gsz3ZR/Co5LyoDZMEvQ7hqWPH2hF3gT34U9ZGkerQm0OPbJttSHksjXbluZGfW3dIj
 MfBWK9ixvX9Nx3HOzP9J8v5fVLdhR+p2vGpiVXA+Fr/1IcroKEHN3MZUCgvM8wVKj/XI
 7BFeZdYW27GJcuLQlUAcYDxHU/EDHcX6zqWdWaVQzjKrZVMuqfduBilJ+kV6oRFZ1Gin
 xZDpIW2Jy3H9eROXj3JvDY90hh83hhGgw+yVPTuk2P1tZT9N8rWbReYbCfAxS2ui/PJg
 UQS8WtD48miLABgmha4sYPyNLUo8d5qpRAL8LupWzG0djg8xpAGrLlVZuhoiYJH2+aXi
 0rAA==
X-Gm-Message-State: AOAM533KtVo00YiMmm1nYybauJhFdFiLxvdjBYqpXgq5izStZ9n8pSM6
 HpaO/hFpPySQwOoenQ/JFtKYhiAdLNOrgl4XWTg=
X-Google-Smtp-Source: ABdhPJzaejM3Xr2VgbpqwhcXTx3LLy3/NKlDmbBKKHdJ4Aa/k7DMLgaddvUjcXNI+YON7v7n8g9Dfoc8j9MnEg9H5Dc=
X-Received: by 2002:a17:903:124a:b0:154:c7a4:9375 with SMTP id
 u10-20020a170903124a00b00154c7a49375mr20734551plh.0.1652188751302; Tue, 10
 May 2022 06:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
In-Reply-To: <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Tue, 10 May 2022 21:18:44 +0800
Message-ID: <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 10, 2022 at 8:47 PM Hsin-Yi Wang wrote: > > On
 Tue, May 10, 2022 at 8:31 PM Xiongwei Song wrote: > > > > Hi Hsin-Yi, > >
 > > On Mon, May 9, 2022 at 10:29 PM Hsin-Yi Wang wrote: > > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sxwjean[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.50 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1noPlk-0000hp-SE
X-Mailman-Approved-At: Wed, 11 May 2022 19:35:29 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 Zhang Yi <yi.zhang@huawei.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Hou Tao <houtao1@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBNYXkgMTAsIDIwMjIgYXQgODo0NyBQTSBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMTAsIDIwMjIgYXQgODozMSBQTSBYaW9u
Z3dlaSBTb25nIDxzeHdqZWFuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgSHNpbi1ZaSwK
PiA+Cj4gPiBPbiBNb24sIE1heSA5LCAyMDIyIGF0IDEwOjI5IFBNIEhzaW4tWWkgV2FuZyA8aHNp
bnlpQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgTWF5IDksIDIwMjIg
YXQgOToyMSBQTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4g
PiA+ID4KPiA+ID4gPiBPbiBNb24sIE1heSAwOSwgMjAyMiBhdCAwODo0Mzo0NVBNICswODAwLCBY
aW9uZ3dlaSBTb25nIHdyb3RlOgo+ID4gPiA+ID4gSGkgSHNpbi1ZaSBhbmQgTWF0dGhldywKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBXaXRoIHRoZSBwYXRjaCBmcm9tIHRoZSBhdHRhY2htZW50IG9uIGxp
bnV4IDUuMTAsIHJhbiB0aGUgY29tbWFuZCBhcyBJCj4gPiA+ID4gPiBtZW50aW9uZWQgZWFybGll
ciwKPiA+ID4gPiA+IGdvdCB0aGUgcmVzdWx0cyBiZWxvdzoKPiA+ID4gPiA+IDE6NDAuNjUgKDFt
ICsgNDAuNjVzKQo+ID4gPiA+ID4gMToxMC4xMgo+ID4gPiA+ID4gMToxMS4xMAo+ID4gPiA+ID4g
MToxMS40Nwo+ID4gPiA+ID4gMToxMS41OQo+ID4gPiA+ID4gMToxMS45NAo+ID4gPiA+ID4gMTox
MS44Ngo+ID4gPiA+ID4gMToxMi4wNAo+ID4gPiA+ID4gMToxMi4yMQo+ID4gPiA+ID4gMToxMi4w
Ngo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBwZXJmb3JtYW5jZSBoYXMgaW1wcm92ZWQgb2J2aW91
c2x5LCBidXQgY29tcGFyZWQgdG8gbGludXggNC4xOCwgdGhlCj4gPiA+ID4gPiBwZXJmb3JtYW5j
ZSBpcyBub3Qgc28gZ29vZC4KPiA+ID4gPiA+Cj4gPiA+IEkgdGhpbmsgeW91IHNob3VsZG4ndCBj
b21wYXJlIHRoZSBwZXJmb3JtYW5jZSB3aXRoIDQuMTggZGlyZWN0bHksCj4gPiA+IHNpbmNlIHRo
ZXJlIG1pZ2h0IGJlIG90aGVyIGZhY3RvcnMgdGhhdCBpbXBhY3QgdGhlIHBlcmZvcm1hbmNlLgo+
ID4KPiA+IE1ha2Ugc2Vuc2UuCj4gPgo+ID4gPkknZCBzdWdnZXN0IGNvbXBhcmluZyB0aGUgc2Ft
ZSBrZXJuZWwgdmVyc2lvbiB3aXRoOgo+ID4gPiBhKSB3aXRoIHRoaXMgcGF0Y2gKPiA+ID4gYikg
d2l0aCBjMWY2OTI1ZTEwOTEgKCJtbTogcHV0IHJlYWRhaGVhZCBwYWdlcyBpbiBjYWNoZSBlYXJs
aWVyIikgcmV2ZXJ0ZWQuCj4gPgo+ID4gV2l0aCA5ZWVjMWQ4OTcxMzkgKCJzcXVhc2hmczogcHJv
dmlkZSBiYWNraW5nX2Rldl9pbmZvIGluIG9yZGVyIHRvIGRpc2FibGUKPiA+IHJlYWQtYWhlYWQi
KSByZXZlcnRlZCBhbmQgYXBwbGllZCAwMDAxLVdJUC1zcXVhc2hmcy1pbXBsZW1lbnQtcmVhZGFo
ZWFkLnBhdGNoLAo+ID4gdGVzdCByZXN1bHQgb24gbGludXggNS4xOO+8mgo+ID4gMTo0MS41MSAo
MW0gKyA0MS41MXMpCj4gPiAxOjA4LjExCj4gPiAxOjEwLjM3Cj4gPiAxOjExLjE3Cj4gPiAxOjEx
LjMyCj4gPiAxOjExLjU5Cj4gPiAxOjEyLjIzCj4gPiAxOjEyLjA4Cj4gPiAxOjEyLjc2Cj4gPiAx
OjEyLjUxCj4gPgo+ID4gcGVyZm9ybWFuY2Ugd29yc2UgMSB+IDJzIHRoYW4gbGludXggNS4xOCB2
YW5pbGxhLgo+ID4KPgo+IENhbiB5b3Ugc2hhcmUgdGhlIHBhY2sgZmlsZSB5b3UgdXNlZCBmb3Ig
dGVzdGluZz8gVGhhbmtzCgpZb3UgYXJlIHNheWluZyB0aGUgZmlsZXMgdGhhdCBhcmUgcHV0IGlu
IHNxdWFzaGZzIHBhcnRpdGlvbnM/IElmIHllcywgSSBjYW4gdGVsbApJIGp1c3QgcHV0IHNvbWUg
ZHluYW1pYyBsaWJyYXJpZXMgaW4gcGFydGl0aW9uczoKLXJ3eHIteHIteCAxIHJvb3Qgcm9vdCAg
MjAwNjgwIEFwciAyMCAwMzo1NyBsZC0yLjMzLnNvCmxyd3hyd3hyd3ggMSByb290IHJvb3QgICAg
ICAxMCBBcHIgMjAgMDM6NTcgbGQtbGludXgteDg2LTY0LnNvLjIgLT4gbGQtMi4zMy5zbwotcnd4
ci14ci14IDEgcm9vdCByb290ICAgMTg3NzYgQXByIDIwIDAzOjU3IGxpYmFubC0yLjMzLnNvCmxy
d3hyd3hyd3ggMSByb290IHJvb3QgICAgICAxNCBBcHIgMjAgMDM6NTcgbGliYW5sLnNvLjEgLT4g
bGliYW5sLTIuMzMuc28KbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAgICAgIDE3IEFwciAyMCAwNDow
OCBsaWJibGtpZC5zby4xIC0+IGxpYmJsa2lkLnNvLjEuMS4wCi1yd3hyLXhyLXggMSByb290IHJv
b3QgIDMzMDc3NiBBcHIgMjAgMDQ6MDggbGliYmxraWQuc28uMS4xLjAKLXJ3eHIteHIteCAxIHJv
b3Qgcm9vdCAxODIzMTkyIEFwciAyMCAwMzo1NyBsaWJjLTIuMzMuc28KLi4uLi4uIHNuaXAgLi4u
Li4uCgpUaGUgbnVtYmVyIG9mIGZpbGVzIGlzIDExMCg1NSBsaWJzICsgNTUgc29mdCBsaW5rcyB0
byBsaWJzKS4gIEkgaGF2ZSA5MCBzcXVhc2hmcwpwYXJ0aXRpb25zIHdoaWNoIHNhdmUgdGhlIGlk
ZW50aWNhbCBmaWxlcy4gVGhlIHNwYWNlIG9mIGVhY2ggcGFydGl0aW9uIGlzIDExTSwKbm90aGlu
ZyBzcGVjaWFsLgoKVGhhbmtzLgoKCgoKCgo+ID4gPgo+ID4gPiBBY2NvcmRpbmcgdG8gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vWW5memgyaWZHODVNWkVvTkBjYXNwZXIuaW5mcmFk
ZWFkLm9yZy90Lwo+ID4gPiBJdCBzZWVtcyB0byBiZSBhIDMgc2VjIGRpZmZlcmVuY2U/Cj4gPgo+
ID4gNSB+IDZzIGRpZmZlcmVuY2UuCj4gPgo+ID4gUmVnYXJkcywKPiA+IFhpb25nd2VpCj4gPgo+
ID4gPgo+ID4gPiAxOjM3LjE2ICgxbSArIDM3LjE2cykKPiA+ID4gMTowNC4xOAo+ID4gPiAxOjA1
LjI4Cj4gPiA+IDE6MDYuMDcKPiA+ID4gMTowNi4zMQo+ID4gPiAxOjA2LjU4Cj4gPiA+IDE6MDYu
ODAKPiA+ID4gMTowNi43OQo+ID4gPiAxOjA2Ljk1Cj4gPiA+IDE6MDYuNjEKPiA+ID4KPiA+ID4g
PiA+IE1vcmVvdmVyLCBJIHdhbnRlZCB0byB0ZXN0IG9uIGxpbnV4IDUuMTguIEJ1dCBJIHRoaW5r
IEkgc2hvdWxkIHJldmVydAo+ID4gPiA+ID4gOWVlYzFkODk3MTM5ICgic3F1YXNoZnM6IHByb3Zp
ZGUgYmFja2luZ19kZXZfaW5mbyBpbiBvcmRlciB0byBkaXNhYmxlCj4gPiA+ID4gPiByZWFkLWFo
ZWFkIiksCj4gPiA+ID4gPiByaWdodD8gIE90aGVyd2lzZSwgdGhlIHBhdGNoIGRvZXNuJ3Qgd29y
az8KPiA+ID4gPgo+ID4gPiA+IEkndmUgbmV2ZXIgc2VlbiBwYXRjaCA5ZWVjMWQ4OTcxMzkgYmVm
b3JlLiAgSWYgeW91J3JlIGdvaW5nIHRvIHBvaW50Cj4gPiA+ID4gb3V0IGJ1Z3MgaW4gbXkgY29k
ZSwgYXQgbGVhc3QgaGF2ZSB0aGUgZGVjZW5jeSB0byBjYyBtZSBvbiBpdC4gIEl0Cj4gPiA+ID4g
c2hvdWxkIG5ldmVyIGhhdmUgZ29uZSBpbiwgYW5kIHNob3VsZCBiZSByZXZlcnRlZCBzbyB0aGUg
cHJvYmxlbSBjYW4KPiA+ID4gPiBiZSBmaXhlZCBwcm9wZXJseS4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpTcXVhc2hmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKU3F1YXNoZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL3NxdWFzaGZzLWRldmVsCg==
