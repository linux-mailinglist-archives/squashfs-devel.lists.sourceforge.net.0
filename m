Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9B5523D9C
	for <lists+squashfs-devel@lfdr.de>; Wed, 11 May 2022 21:35:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nos7O-00072L-IX; Wed, 11 May 2022 19:35:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1noPOF-0008N0-Ud
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 12:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FGn9sKlm8/KLTuSL2PYTkdb7eNaudg4yFMJpLEDFWcM=; b=C1J+Xxe4So9rbJggUb7TcxdUF/
 KwEQPJ0bjIDFf4BYWCXzGyDz/K2AykJj/6TlL98DDoSQcqDL5wmGjmKd/Wx+HbgKp4VxV2MsogA6X
 yufboCXUzj7ANmidBsz+5XbZ5R6WwKmPKI80v6ls+NpEMODB6jDBXHO0jvDtAKdBQMvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FGn9sKlm8/KLTuSL2PYTkdb7eNaudg4yFMJpLEDFWcM=; b=YiJJYnmUPm5rP8h+OwaR14gfAm
 68tMQH724Axvj1Fg4zDFDa1fXzTuPZPBxDpAvoznCG07apCy0XFMqJ7KNzVODfcQSkXIOYNFg8Nka
 ebFKwsOFMmrKwh+NNmFDYBTKk1g4mN9/n8mhAWp5RI2Svy0hgW4+WoU17H8pa0DVMYXE=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1noPOD-0007wP-RR
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 12:54:58 +0000
Received: by mail-pg1-f177.google.com with SMTP id 15so14567140pgf.4
 for <squashfs-devel@lists.sourceforge.net>;
 Tue, 10 May 2022 05:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FGn9sKlm8/KLTuSL2PYTkdb7eNaudg4yFMJpLEDFWcM=;
 b=UJtXkzwKZoXMrDpvnHvsjZPo3qS/kJVI/Rl8DDPUo7afD1nYOh4ViB06V7w+29W0hq
 dT8tvZFybapl4g9tnMvarxquEmjvMBx7SmUn9r+E6ear9HnMj9XUGIkyzSsiDSRjoLW+
 PJ7Iv2n9/91j6l4GGzvgDF31/y66DrewUaaqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FGn9sKlm8/KLTuSL2PYTkdb7eNaudg4yFMJpLEDFWcM=;
 b=ngXt3YB6tg8x4vIPFNNoT+utJ+IptIn+ImlL3qONsX9r+tfCHqzeqVBZbnSG1yMLbV
 b5YZg3iq2GCq4l/eqDKw2aslZ5jFTiD0ThHzInXNO23INIMDpN94zl6ZVLYqjF0vXe/7
 VTzXKn9ku64Rk01K8QzFp4ze8UxNCSf5qaPdu6aUY77gKZJ/gTSNJJmdsGewo2UuY2Pz
 7iKCm90X+rVNyEPR+1AP27Po1HW84K2Q1GYb1sFUXrLdoajPMbsydaUMery6JvmtK5CO
 nsIac7HtDKQqzFY1o12Cb6RAd+da71KV5NwzCuiZxg7IrImQDOpWtWIqEsRGW4YCVpZa
 mS9A==
X-Gm-Message-State: AOAM5302px8aaDQMS9CAH9gMBActM97RNpy4mbGWxhhqtkpEXUtTVCrt
 quioPhBYlsBUwt5Z5H7EdYq7YAhul3S+t/lWq5areQHf/Ys=
X-Google-Smtp-Source: ABdhPJyuNLiEBXxbagfBEPMGKdlK1Y1KP3aZJ4Syz58dSxtTXqm4UbcDizv0/DY3+kuxB0uqKK6GwMHKoUoeTe4jKtM=
X-Received: by 2002:a05:6122:20ab:b0:352:1914:5358 with SMTP id
 i43-20020a05612220ab00b0035219145358mr11709735vkd.6.1652186868480; Tue, 10
 May 2022 05:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
In-Reply-To: <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 10 May 2022 20:47:22 +0800
Message-ID: <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
To: Xiongwei Song <sxwjean@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 10,
 2022 at 8:31 PM Xiongwei Song <sxwjean@gmail.com>
 wrote: > > Hi Hsin-Yi, > > On Mon, May 9,
 2022 at 10:29 PM Hsin-Yi Wang <hsinyi@chromium.org>
 wrote: > > > > On Mon, May 9, 2022 at 9: [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.177 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1noPOD-0007wP-RR
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

T24gVHVlLCBNYXkgMTAsIDIwMjIgYXQgODozMSBQTSBYaW9uZ3dlaSBTb25nIDxzeHdqZWFuQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBIc2luLVlpLAo+Cj4gT24gTW9uLCBNYXkgOSwgMjAyMiBh
dCAxMDoyOSBQTSBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIE1vbiwgTWF5IDksIDIwMjIgYXQgOToyMSBQTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgTWF5IDA5LCAyMDIyIGF0
IDA4OjQzOjQ1UE0gKzA4MDAsIFhpb25nd2VpIFNvbmcgd3JvdGU6Cj4gPiA+ID4gSGkgSHNpbi1Z
aSBhbmQgTWF0dGhldywKPiA+ID4gPgo+ID4gPiA+IFdpdGggdGhlIHBhdGNoIGZyb20gdGhlIGF0
dGFjaG1lbnQgb24gbGludXggNS4xMCwgcmFuIHRoZSBjb21tYW5kIGFzIEkKPiA+ID4gPiBtZW50
aW9uZWQgZWFybGllciwKPiA+ID4gPiBnb3QgdGhlIHJlc3VsdHMgYmVsb3c6Cj4gPiA+ID4gMTo0
MC42NSAoMW0gKyA0MC42NXMpCj4gPiA+ID4gMToxMC4xMgo+ID4gPiA+IDE6MTEuMTAKPiA+ID4g
PiAxOjExLjQ3Cj4gPiA+ID4gMToxMS41OQo+ID4gPiA+IDE6MTEuOTQKPiA+ID4gPiAxOjExLjg2
Cj4gPiA+ID4gMToxMi4wNAo+ID4gPiA+IDE6MTIuMjEKPiA+ID4gPiAxOjEyLjA2Cj4gPiA+ID4K
PiA+ID4gPiBUaGUgcGVyZm9ybWFuY2UgaGFzIGltcHJvdmVkIG9idmlvdXNseSwgYnV0IGNvbXBh
cmVkIHRvIGxpbnV4IDQuMTgsIHRoZQo+ID4gPiA+IHBlcmZvcm1hbmNlIGlzIG5vdCBzbyBnb29k
Lgo+ID4gPiA+Cj4gPiBJIHRoaW5rIHlvdSBzaG91bGRuJ3QgY29tcGFyZSB0aGUgcGVyZm9ybWFu
Y2Ugd2l0aCA0LjE4IGRpcmVjdGx5LAo+ID4gc2luY2UgdGhlcmUgbWlnaHQgYmUgb3RoZXIgZmFj
dG9ycyB0aGF0IGltcGFjdCB0aGUgcGVyZm9ybWFuY2UuCj4KPiBNYWtlIHNlbnNlLgo+Cj4gPkkn
ZCBzdWdnZXN0IGNvbXBhcmluZyB0aGUgc2FtZSBrZXJuZWwgdmVyc2lvbiB3aXRoOgo+ID4gYSkg
d2l0aCB0aGlzIHBhdGNoCj4gPiBiKSB3aXRoIGMxZjY5MjVlMTA5MSAoIm1tOiBwdXQgcmVhZGFo
ZWFkIHBhZ2VzIGluIGNhY2hlIGVhcmxpZXIiKSByZXZlcnRlZC4KPgo+IFdpdGggOWVlYzFkODk3
MTM5ICgic3F1YXNoZnM6IHByb3ZpZGUgYmFja2luZ19kZXZfaW5mbyBpbiBvcmRlciB0byBkaXNh
YmxlCj4gcmVhZC1haGVhZCIpIHJldmVydGVkIGFuZCBhcHBsaWVkIDAwMDEtV0lQLXNxdWFzaGZz
LWltcGxlbWVudC1yZWFkYWhlYWQucGF0Y2gsCj4gdGVzdCByZXN1bHQgb24gbGludXggNS4xOO+8
mgo+IDE6NDEuNTEgKDFtICsgNDEuNTFzKQo+IDE6MDguMTEKPiAxOjEwLjM3Cj4gMToxMS4xNwo+
IDE6MTEuMzIKPiAxOjExLjU5Cj4gMToxMi4yMwo+IDE6MTIuMDgKPiAxOjEyLjc2Cj4gMToxMi41
MQo+Cj4gcGVyZm9ybWFuY2Ugd29yc2UgMSB+IDJzIHRoYW4gbGludXggNS4xOCB2YW5pbGxhLgo+
CgpDYW4geW91IHNoYXJlIHRoZSBwYWNrIGZpbGUgeW91IHVzZWQgZm9yIHRlc3Rpbmc/IFRoYW5r
cwo+ID4KPiA+IEFjY29yZGluZyB0byBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS9Z
bmZ6aDJpZkc4NU1aRW9OQGNhc3Blci5pbmZyYWRlYWQub3JnL3QvCj4gPiBJdCBzZWVtcyB0byBi
ZSBhIDMgc2VjIGRpZmZlcmVuY2U/Cj4KPiA1IH4gNnMgZGlmZmVyZW5jZS4KPgo+IFJlZ2FyZHMs
Cj4gWGlvbmd3ZWkKPgo+ID4KPiA+IDE6MzcuMTYgKDFtICsgMzcuMTZzKQo+ID4gMTowNC4xOAo+
ID4gMTowNS4yOAo+ID4gMTowNi4wNwo+ID4gMTowNi4zMQo+ID4gMTowNi41OAo+ID4gMTowNi44
MAo+ID4gMTowNi43OQo+ID4gMTowNi45NQo+ID4gMTowNi42MQo+ID4KPiA+ID4gPiBNb3Jlb3Zl
ciwgSSB3YW50ZWQgdG8gdGVzdCBvbiBsaW51eCA1LjE4LiBCdXQgSSB0aGluayBJIHNob3VsZCBy
ZXZlcnQKPiA+ID4gPiA5ZWVjMWQ4OTcxMzkgKCJzcXVhc2hmczogcHJvdmlkZSBiYWNraW5nX2Rl
dl9pbmZvIGluIG9yZGVyIHRvIGRpc2FibGUKPiA+ID4gPiByZWFkLWFoZWFkIiksCj4gPiA+ID4g
cmlnaHQ/ICBPdGhlcndpc2UsIHRoZSBwYXRjaCBkb2Vzbid0IHdvcms/Cj4gPiA+Cj4gPiA+IEkn
dmUgbmV2ZXIgc2VlbiBwYXRjaCA5ZWVjMWQ4OTcxMzkgYmVmb3JlLiAgSWYgeW91J3JlIGdvaW5n
IHRvIHBvaW50Cj4gPiA+IG91dCBidWdzIGluIG15IGNvZGUsIGF0IGxlYXN0IGhhdmUgdGhlIGRl
Y2VuY3kgdG8gY2MgbWUgb24gaXQuICBJdAo+ID4gPiBzaG91bGQgbmV2ZXIgaGF2ZSBnb25lIGlu
LCBhbmQgc2hvdWxkIGJlIHJldmVydGVkIHNvIHRoZSBwcm9ibGVtIGNhbgo+ID4gPiBiZSBmaXhl
ZCBwcm9wZXJseS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpTcXVhc2hmcy1kZXZlbCBtYWlsaW5nIGxpc3QKU3F1YXNoZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L3NxdWFzaGZzLWRldmVsCg==
