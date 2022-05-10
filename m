Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1115B523D9D
	for <lists+squashfs-devel@lfdr.de>; Wed, 11 May 2022 21:35:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nos7O-00072D-GN; Wed, 11 May 2022 19:35:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1noGlO-0003Nf-Vc
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 03:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LR/VluszZvIcrpLR6yJ31IHVq9L6AlZJA+4fUMFIRdo=; b=IQmvmrArvLvN+8voDTV6ycU8b7
 hBnhlsRTT9826QZZKGog5mXnLr3FExt+U4ChYM+7MuUi2MzAB8LzK/FsuZtyDlGvFuXk0acKOG2VL
 0XF2VCy+Q5EdaNDWSJPRtHXsAVYxRjJl+o7bWOv93Zy7HKtskrFdkFi9xnSKobZQjIA0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LR/VluszZvIcrpLR6yJ31IHVq9L6AlZJA+4fUMFIRdo=; b=Fq6+uVJv6gOwVV11lwepIXx+d5
 A3k0Eqhi9jsFt3ExrPauuvsR0hvQmvazOEF2Yu1Z7ftvMvlBSysIsc/J/FdDL7Gy2GVc97K/j5qrt
 Huj+nYEYw7GFR4zoBrWCo7lg3sYEzPiGV6s4tNKv1kK/POK15UvWf3PmfaDANhy1raiM=;
Received: from p3plsmtp22-02-2.prod.phx3.secureserver.net ([68.178.252.56]
 helo=p3plwbeout22-02.prod.phx3.secureserver.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1noGlM-0004GI-0q
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 03:42:17 +0000
Received: from mailex.mailcore.me ([94.136.40.142]) by :WBEOUT: with ESMTP
 id oGlAnjJJMKY9GoGlBnagpy; Mon, 09 May 2022 20:42:05 -0700
X-CMAE-Analysis: v=2.4 cv=c/Zu/Txl c=1 sm=1 tr=0 ts=6279df0d
 a=s1hRAmXuQnGNrIj+3lWWVA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=oZkIemNP1mAA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=c8wRBholBsc881OVBegA:9 a=QEXdDO2ut3YA:10
 a=kzUPhV2tFCwA:10 a=1LVkccGuNtIA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: oGlAnjJJMKY9G
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.33])
 by smtp02.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1noGlA-00082F-0Q; Tue, 10 May 2022 04:42:04 +0100
Message-ID: <fdfad5c9-3e5d-efbe-a39e-c26e3fd11975@squashfs.org.uk>
Date: Tue, 10 May 2022 04:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: Phillip Lougher <phillip@squashfs.org.uk>
To: Matthew Wilcox <willy@infradead.org>
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <13af40a9-6b60-6875-8326-0827e34182d5@squashfs.org.uk>
 <YnnPYD+VtQB6hlnL@casper.infradead.org>
 <1dff431e-f51d-edb0-5abc-353ceeef50ed@squashfs.org.uk>
In-Reply-To: <1dff431e-f51d-edb0-5abc-353ceeef50ed@squashfs.org.uk>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfNPaYDdaynbEWVPhLYf0c31ZbCtCrcWzT/9bBicsjHFXq3aQP0OX4F7YHBYp1m+VDb3+Xp6UNMx/f4BuJ/vAXGsvtrkJV+fmLOnaflrMQ3SHPwONA+XD
 LJ6JWJK61ZuVf6QTnnBxkBPWJHiBZGbHvtq5vkAoFn7YftrcQmpei99xH4L7ZOxM55tGzvgHOoN31/F41BItDLdYpYZYME14VWElfOhRq46368w4r7srCpUl
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/05/2022 04:20, Phillip Lougher wrote: > On 10/05/2022
 03:35, Matthew Wilcox wrote: >> On Tue, May 10, 2022 at 02:11:41AM +0100,
 Phillip Lougher wrote: >>> On 09/05/2022 14:21, Matthew Wilcox wro [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [68.178.252.56 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1noGlM-0004GI-0q
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
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, open list <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

T24gMTAvMDUvMjAyMiAwNDoyMCwgUGhpbGxpcCBMb3VnaGVyIHdyb3RlOgo+IE9uIDEwLzA1LzIw
MjIgMDM6MzUsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+PiBPbiBUdWUsIE1heSAxMCwgMjAyMiBh
dCAwMjoxMTo0MUFNICswMTAwLCBQaGlsbGlwIExvdWdoZXIgd3JvdGU6Cj4+PiBPbiAwOS8wNS8y
MDIyIDE0OjIxLCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPj4+PiBPbiBNb24sIE1heSAwOSwgMjAy
MiBhdCAwODo0Mzo0NVBNICswODAwLCBYaW9uZ3dlaSBTb25nIHdyb3RlOgo+Pj4+PiBIaSBIc2lu
LVlpIGFuZCBNYXR0aGV3LAo+Pj4+Pgo+Pj4+PiBXaXRoIHRoZSBwYXRjaCBmcm9tIHRoZSBhdHRh
Y2htZW50IG9uIGxpbnV4IDUuMTAsIHJhbiB0aGUgY29tbWFuZCBhcyBJCj4+Pj4+IG1lbnRpb25l
ZCBlYXJsaWVyLAo+Pj4+PiBnb3QgdGhlIHJlc3VsdHMgYmVsb3c6Cj4+Pj4+IDE6NDAuNjUgKDFt
ICsgNDAuNjVzKQo+Pj4+PiAxOjEwLjEyCj4+Pj4+IDE6MTEuMTAKPj4+Pj4gMToxMS40Nwo+Pj4+
PiAxOjExLjU5Cj4+Pj4+IDE6MTEuOTQKPj4+Pj4gMToxMS44Ngo+Pj4+PiAxOjEyLjA0Cj4+Pj4+
IDE6MTIuMjEKPj4+Pj4gMToxMi4wNgo+Pj4+Pgo+Pj4+PiBUaGUgcGVyZm9ybWFuY2UgaGFzIGlt
cHJvdmVkIG9idmlvdXNseSwgYnV0IGNvbXBhcmVkIHRvIGxpbnV4IDQuMTgsIAo+Pj4+PiB0aGUK
Pj4+Pj4gcGVyZm9ybWFuY2UgaXMgbm90IHNvIGdvb2QuCj4+Pj4+Cj4+Pj4+IE1vcmVvdmVyLCBJ
IHdhbnRlZCB0byB0ZXN0IG9uIGxpbnV4IDUuMTguIEJ1dCBJIHRoaW5rIEkgc2hvdWxkIHJldmVy
dAo+Pj4+PiA5ZWVjMWQ4OTcxMzkgKCJzcXVhc2hmczogcHJvdmlkZSBiYWNraW5nX2Rldl9pbmZv
IGluIG9yZGVyIHRvIGRpc2FibGUKPj4+Pj4gcmVhZC1haGVhZCIpLAo+Pj4+PiByaWdodD/CoCBP
dGhlcndpc2UsIHRoZSBwYXRjaCBkb2Vzbid0IHdvcms/Cj4+Pj4KPj4+PiBJJ3ZlIG5ldmVyIHNl
ZW4gcGF0Y2ggOWVlYzFkODk3MTM5IGJlZm9yZS7CoCBJZiB5b3UncmUgZ29pbmcgdG8gcG9pbnQK
Pj4+PiBvdXQgYnVncyBpbiBteSBjb2RlLCBhdCBsZWFzdCBoYXZlIHRoZSBkZWNlbmN5IHRvIGNj
IG1lIG9uIGl0LsKgIEl0Cj4+Pj4gc2hvdWxkIG5ldmVyIGhhdmUgZ29uZSBpbiwgYW5kIHNob3Vs
ZCBiZSByZXZlcnRlZCBzbyB0aGUgcHJvYmxlbSBjYW4KPj4+PiBiZSBmaXhlZCBwcm9wZXJseS4K
Pj4+Cj4+PiBZb3UgYXJlIG5vdCBpbiBjaGFyZ2Ugb2Ygd2hhdCBwYXRjaGVzIGdvZXMgaW50byBT
cXVhc2hmcywgdGhhdCBpcyBteQo+Pj4gcGVyb2dhdGl2ZSBhcyBtYWludGFpbmVyIG9mIFNxdWFz
aGZzLgo+Pgo+PiBJIHRoaW5rIHlvdSBtZWFuICdwcmVyb2dhdGl2ZScuwqAgQW5kLCBubywgeW91
ciBmaWxlc3lzdGVtIGlzIG5vdCB5b3VyCj4+IGxpdHRsZSBmaWVmZG9tLCBpdCdzIHBhcnQgb2Yg
YSBjb2xsYWJvcmF0aXZlIGVmZm9ydC4KPj4KPiAKPiBUaGlzIGlzbid0IGEgc3BlbGxpbmcgY29u
dGVzdCwgYW5kIGlmIHRoYXQncyB0aGUgYmVzdCB5b3UgY2FuIGRvIHlvdQo+IGhhdmUgYWxyZWFk
eSBmYWlsZWQuCj4gCj4gQmUgY2FyZWZ1bGwgaGVyZSBhbHNvLCBJIGhhdmUgYmVlbiBtYWludGFp
bmVyIG9mIFNxdWFzaGZzIGZvciAyMCB5ZWFycywKPiBhbmQgd2FzIGtlcm5lbCBtYWludGFpbmVy
IGZvciBib3RoIFVidW50dSBhbmQgUmVkaGF0IGZvciAxMCB5ZWFycywgYW5kCj4gc28gSSBhbSBl
eHBlcmllbmNlZCBtZW1iZXIgb2YgdGhlIGNvbW11bml0eS4KPiAKPiBZb3UgcmVwbHkgaXMgYm9y
ZGVyaW5nIG9uIG9mZmVuc2l2ZSBhbmQgYXJyb2dhbnQsIGVzcGVjaWFsbHkgY29uc2lkZXJpbmcK
PiBpdCBpcyB1bndhcnJhbnRlZC7CoCBJIGRpZCBub3Qgc2V0IG91dCB0byBvZmZlbmQgeW91LCBh
bmQgSSBkb24ndAo+IGFwcHJlY2lhdGUgaXQuCj4gCj4gQWJvdXQgOCB5ZWFycyBhZ28gSSBkZWNp
ZGVkIHRvIHJlZnJhaW4gZnJvbSBhY3RpdmUgaW52b2x2ZW1lbnQgaW4gdGhlCj4ga2VybmVsIGNv
bW11bml0eSwgYmVjYXVzZSBJIGRlY2lkZWQgdGhlIGxldmVsIG9mIGRpc2NvdXJzZSB3YXMKPiBk
aXNndXN0aW5nLCBhbmQgSSBoYWQgZW5vdWdoIG9mIGl0Lgo+IAo+IEkgcG9wZWQgdXAgbm93IHRv
IGRlZmVuZCBteSBhcHByb3ZhbCBvZiB0aGUgSHVhd2VpIHBhdGNoLsKgIEkgYW0gKnF1aXRlKgo+
IGhhcHB5IG5vdCB0byBoYXZlIGFueSBtb3JlIGludm9sdmVtZW50IHVudGlsIG5lY2Vzc2FyeS4K
PiAKPiBTbyBoYXZpbmcgc2FpZCB3aGF0IEkgd2FudCB0byBzYXksIEkgd2lsbCBsZWF2ZSBpdCBh
dCB0aGF0LiBZb3UgaGF2ZQo+IGp1c3QgcHJvdmVkIHdoeSBJIGhhdmUgbWluaW1pc2VkIG15IGlu
dm9sdmVtZW50Lgo+IAo+IE5vIGRvdWJ0IHlvdSdsbCB0aHJvdyB5b3VyIHRveXMgb3V0IHRoZSBw
cmFtLCBidXQsIEknbSBubwo+IGxvbmdlciBsaXN0ZW5pbmcgc28gZG9uJ3QgYm90aGVyLgo+IAo+
IAo+Pj4gVGhhdCBwYXRjaCAoYnkgSHVhd2VpKSBmaXhlcyB0aGUgcGVyZm9ybWFuY2UgcmVncmVz
c2lvbiBpbiBTcXVhc2hmcwo+Pj4gYnkgZGlzYWJsaW5nIHJlYWRhaGVhZCwgYW5kIGl0IGlzIGdv
b2Qgd29ya2Fyb3VuZCB1bnRpbCBzb21ldGhpbmcKPj4+IGJldHRlci4KPj4KPj4gWW91ICpkaWRu
J3QgZXZlbiByZXBvcnQgdGhlIHByb2JsZW0gdG8gbWUqLsKgIEhvdyBjYW4gaXQgYmUgZml4ZWQg
aWYgSSdtCj4+IG5vdCBhd2FyZSBvZiBpdD8KCkRlc3BpdGUgaGF2aW5nIGJlZW4gaW5zdWx0ZWQs
IEkgaGF2ZSBkb25lIHlvdXIgaG9tZXdvcmsgZm9yIHlvdS4KClRoaXMgaXMgd2hlcmUgdGhlIHBy
b2JsZW0gd2FzIHJhaXNlZCBsYXN0IHllYXIsIHdpdGggeW91IGRpcmVjdGx5CmVtYWlsZWQuCgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FKTVFLLWc5RzZLUW1ILVY9QlJHWDBzd1pqaTlX
eGVfMmM3aHQtTU1BYXBkRnkycFh3QG1haWwuZ21haWwuY29tL1QvCgo+Pgo+IAo+IFRoZXJlIHdh
cyBhIGVtYWlsIGRpc2N1c3Npb24gbGFzdCB5ZWFyLCB3aGljaCBJIHJlc3BvbmRlZCB0bywgYW5k
IGdvdAo+IGlnbm9yZWQuwqAgSSB3aWxsIGZpbmQgaXQgb3V0IHRvbW9ycm93LCBwZXJoYXBzLsKg
IEJ1dCBJIHdpbGwgcHJvYmFibHkKPiBub3QgYm90aGVyLCBiZWNhdXNlIGxpZmUgaXMgdG9vIHNo
b3J0Lgo+IAoKQWZ0ZXJ3YXJkcyB5b3Ugc3RhcnRlZCBhIHRocmVhZCBvbiAiUmVhZGFoZWFkIGZv
ciBjb21wcmVzc2VkIGRhdGEiLAp3aGljaCBJIHJlc3BvbmRlZCB0by4KCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC9ZWEhLNUhyUXBKdTlveTh3QGNhc3Blci5pbmZyYWRlYWQub3JnL1QvCgoK
PiBDaGVlcnMKPiAKPiBQaGlsbGlwCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClNxdWFzaGZzLWRldmVsIG1haWxpbmcgbGlzdApTcXVhc2hmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vc3F1YXNoZnMtZGV2ZWwK
