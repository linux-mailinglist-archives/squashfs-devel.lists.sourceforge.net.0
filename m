Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF1523DA1
	for <lists+squashfs-devel@lfdr.de>; Wed, 11 May 2022 21:35:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nos7O-00072T-LF; Wed, 11 May 2022 19:35:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1noo7h-00039h-Un
 for squashfs-devel@lists.sourceforge.net; Wed, 11 May 2022 15:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tdRn40e+H/cXEsY18+HTeg0ty+6FMaAq/QLnrCDH6+k=; b=OfARxXc2jgySe6vELv5HxqsG8k
 eRt1sEaGS7g/ZiefCr00f02DVM2jMJ9+X6uwaZ3ool3pHTrF3/63xadXL4XKgZyacPVA3ZLVO7Mg2
 bKILayNMmGoicFyL5N8M1NV/sKElUNy5pTnHn9bARFJ758Crl8ZU98NCOdzH80syVfjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tdRn40e+H/cXEsY18+HTeg0ty+6FMaAq/QLnrCDH6+k=; b=BkLmc0JLPPcHKFxKVQjkbchZj8
 rHvkKtZyyeiL3ZV+Pqm3c69EehDnCXmmDTRtnLA1flk0S9Fo0KH3q7VtLgwj/FrGz+C1yHStmqBNY
 OFixh6SXba+vEbX/jbi8RGbPPNaSuh1/co03gYlPKOEz1oGzRLfY49tVQdjszeYluZOM=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1noo7d-008umg-16
 for squashfs-devel@lists.sourceforge.net; Wed, 11 May 2022 15:19:32 +0000
Received: by mail-pj1-f50.google.com with SMTP id iq10so2578315pjb.0
 for <squashfs-devel@lists.sourceforge.net>;
 Wed, 11 May 2022 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tdRn40e+H/cXEsY18+HTeg0ty+6FMaAq/QLnrCDH6+k=;
 b=Z1h6iWDBc3sAV6VNlKSjuKj6UXFRaDjgsl5Gqh+FdLkJnHPPVsegQlg0xD9SOjyYvD
 WE75FFJqIrd6oPuquoeN2ppsfCVzI/taYHV5hObg9fho7ztJ8LnoZT0/0FvmR8zw+9kf
 2xN9TPYPFRLLEB3/nTlS7NgkJTgxA21kE+U/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tdRn40e+H/cXEsY18+HTeg0ty+6FMaAq/QLnrCDH6+k=;
 b=c4Pl37pFW+BeDdb0lcNX91NC7Z7yPcwBl2WbY60ZdZ728ueSazVvl7NrYFl6mD9iKS
 /+z73E8XHDpKZ8R2kfw8PPdyZsCotjj9ekzvE5aj/PlN0DqaufOsB2niDAJNYD8o+rpu
 kJXY0OMWsUwKzQ2ME+LQkTQsX7TmHMY7KbsR4GI5v+2FFl0J44i3EBPrVGZQS3wj82af
 p/Ou79P1bc8YR6U7gzJkC8jKYNbBRnXn15daugnYLCz+++r/l/a6sFx6+Y/G386Xa2+n
 XrnL/qtkKDxNDvD7RSbBzCyWYz1tOt3RaSqz+20u/3D8iZrZ0LPTMAUk9LQlQ75yigG8
 y9zA==
X-Gm-Message-State: AOAM530Uclcn53jbGciUhswRuyIP4MpBekh/sRO/cv+knhriaFpN/mR8
 j2jsqSlzZAkkOMFZmmTAOI62KnK3JJX2LLLp6HCI6MpoWu+kDg==
X-Google-Smtp-Source: ABdhPJyoaLV7vckWypMwzuis2AtaB9BguHVfwpX3/yY3oVst4Hk397pYU57BOFfMpJoaN3RhGw+X7y+vCIxFXJaeTfo=
X-Received: by 2002:a05:6122:b56:b0:352:253e:56c1 with SMTP id
 22-20020a0561220b5600b00352253e56c1mr14340282vko.5.1652281989302; Wed, 11 May
 2022 08:13:09 -0700 (PDT)
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
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
In-Reply-To: <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 11 May 2022 23:12:43 +0800
Message-ID: <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
To: Xiongwei Song <sxwjean@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 10,
 2022 at 9:19 PM Xiongwei Song <sxwjean@gmail.com>
 wrote: > > On Tue, May 10, 2022 at 8:47 PM Hsin-Yi Wang <hsinyi@chromium.org>
 wrote: > > > > On Tue, May 10, 2022 at 8:31 PM Xiongwei [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1noo7d-008umg-16
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

T24gVHVlLCBNYXkgMTAsIDIwMjIgYXQgOToxOSBQTSBYaW9uZ3dlaSBTb25nIDxzeHdqZWFuQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAxMCwgMjAyMiBhdCA4OjQ3IFBNIEhzaW4t
WWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBNYXkg
MTAsIDIwMjIgYXQgODozMSBQTSBYaW9uZ3dlaSBTb25nIDxzeHdqZWFuQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IEhpIEhzaW4tWWksCj4gPiA+Cj4gPiA+IE9uIE1vbiwgTWF5IDksIDIw
MjIgYXQgMTA6MjkgUE0gSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgTWF5IDksIDIwMjIgYXQgOToyMSBQTSBNYXR0aGV3IFdp
bGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24g
TW9uLCBNYXkgMDksIDIwMjIgYXQgMDg6NDM6NDVQTSArMDgwMCwgWGlvbmd3ZWkgU29uZyB3cm90
ZToKPiA+ID4gPiA+ID4gSGkgSHNpbi1ZaSBhbmQgTWF0dGhldywKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gV2l0aCB0aGUgcGF0Y2ggZnJvbSB0aGUgYXR0YWNobWVudCBvbiBsaW51eCA1LjEwLCBy
YW4gdGhlIGNvbW1hbmQgYXMgSQo+ID4gPiA+ID4gPiBtZW50aW9uZWQgZWFybGllciwKPiA+ID4g
PiA+ID4gZ290IHRoZSByZXN1bHRzIGJlbG93Ogo+ID4gPiA+ID4gPiAxOjQwLjY1ICgxbSArIDQw
LjY1cykKPiA+ID4gPiA+ID4gMToxMC4xMgo+ID4gPiA+ID4gPiAxOjExLjEwCj4gPiA+ID4gPiA+
IDE6MTEuNDcKPiA+ID4gPiA+ID4gMToxMS41OQo+ID4gPiA+ID4gPiAxOjExLjk0Cj4gPiA+ID4g
PiA+IDE6MTEuODYKPiA+ID4gPiA+ID4gMToxMi4wNAo+ID4gPiA+ID4gPiAxOjEyLjIxCj4gPiA+
ID4gPiA+IDE6MTIuMDYKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhlIHBlcmZvcm1hbmNlIGhh
cyBpbXByb3ZlZCBvYnZpb3VzbHksIGJ1dCBjb21wYXJlZCB0byBsaW51eCA0LjE4LCB0aGUKPiA+
ID4gPiA+ID4gcGVyZm9ybWFuY2UgaXMgbm90IHNvIGdvb2QuCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
SSB0aGluayB5b3Ugc2hvdWxkbid0IGNvbXBhcmUgdGhlIHBlcmZvcm1hbmNlIHdpdGggNC4xOCBk
aXJlY3RseSwKPiA+ID4gPiBzaW5jZSB0aGVyZSBtaWdodCBiZSBvdGhlciBmYWN0b3JzIHRoYXQg
aW1wYWN0IHRoZSBwZXJmb3JtYW5jZS4KPiA+ID4KPiA+ID4gTWFrZSBzZW5zZS4KPiA+ID4KPiA+
ID4gPkknZCBzdWdnZXN0IGNvbXBhcmluZyB0aGUgc2FtZSBrZXJuZWwgdmVyc2lvbiB3aXRoOgo+
ID4gPiA+IGEpIHdpdGggdGhpcyBwYXRjaAo+ID4gPiA+IGIpIHdpdGggYzFmNjkyNWUxMDkxICgi
bW06IHB1dCByZWFkYWhlYWQgcGFnZXMgaW4gY2FjaGUgZWFybGllciIpIHJldmVydGVkLgo+ID4g
Pgo+ID4gPiBXaXRoIDllZWMxZDg5NzEzOSAoInNxdWFzaGZzOiBwcm92aWRlIGJhY2tpbmdfZGV2
X2luZm8gaW4gb3JkZXIgdG8gZGlzYWJsZQo+ID4gPiByZWFkLWFoZWFkIikgcmV2ZXJ0ZWQgYW5k
IGFwcGxpZWQgMDAwMS1XSVAtc3F1YXNoZnMtaW1wbGVtZW50LXJlYWRhaGVhZC5wYXRjaCwKPiA+
ID4gdGVzdCByZXN1bHQgb24gbGludXggNS4xOO+8mgo+ID4gPiAxOjQxLjUxICgxbSArIDQxLjUx
cykKPiA+ID4gMTowOC4xMQo+ID4gPiAxOjEwLjM3Cj4gPiA+IDE6MTEuMTcKPiA+ID4gMToxMS4z
Mgo+ID4gPiAxOjExLjU5Cj4gPiA+IDE6MTIuMjMKPiA+ID4gMToxMi4wOAo+ID4gPiAxOjEyLjc2
Cj4gPiA+IDE6MTIuNTEKPiA+ID4KPiA+ID4gcGVyZm9ybWFuY2Ugd29yc2UgMSB+IDJzIHRoYW4g
bGludXggNS4xOCB2YW5pbGxhLgo+ID4gPgo+ID4KPiA+IENhbiB5b3Ugc2hhcmUgdGhlIHBhY2sg
ZmlsZSB5b3UgdXNlZCBmb3IgdGVzdGluZz8gVGhhbmtzCj4KPiBZb3UgYXJlIHNheWluZyB0aGUg
ZmlsZXMgdGhhdCBhcmUgcHV0IGluIHNxdWFzaGZzIHBhcnRpdGlvbnM/IElmIHllcywgSSBjYW4g
dGVsbAo+IEkganVzdCBwdXQgc29tZSBkeW5hbWljIGxpYnJhcmllcyBpbiBwYXJ0aXRpb25zOgo+
IC1yd3hyLXhyLXggMSByb290IHJvb3QgIDIwMDY4MCBBcHIgMjAgMDM6NTcgbGQtMi4zMy5zbwo+
IGxyd3hyd3hyd3ggMSByb290IHJvb3QgICAgICAxMCBBcHIgMjAgMDM6NTcgbGQtbGludXgteDg2
LTY0LnNvLjIgLT4gbGQtMi4zMy5zbwo+IC1yd3hyLXhyLXggMSByb290IHJvb3QgICAxODc3NiBB
cHIgMjAgMDM6NTcgbGliYW5sLTIuMzMuc28KPiBscnd4cnd4cnd4IDEgcm9vdCByb290ICAgICAg
MTQgQXByIDIwIDAzOjU3IGxpYmFubC5zby4xIC0+IGxpYmFubC0yLjMzLnNvCj4gbHJ3eHJ3eHJ3
eCAxIHJvb3Qgcm9vdCAgICAgIDE3IEFwciAyMCAwNDowOCBsaWJibGtpZC5zby4xIC0+IGxpYmJs
a2lkLnNvLjEuMS4wCj4gLXJ3eHIteHIteCAxIHJvb3Qgcm9vdCAgMzMwNzc2IEFwciAyMCAwNDow
OCBsaWJibGtpZC5zby4xLjEuMAo+IC1yd3hyLXhyLXggMSByb290IHJvb3QgMTgyMzE5MiBBcHIg
MjAgMDM6NTcgbGliYy0yLjMzLnNvCj4gLi4uLi4uIHNuaXAgLi4uLi4uCj4KPiBUaGUgbnVtYmVy
IG9mIGZpbGVzIGlzIDExMCg1NSBsaWJzICsgNTUgc29mdCBsaW5rcyB0byBsaWJzKS4gIEkgaGF2
ZSA5MCBzcXVhc2hmcwo+IHBhcnRpdGlvbnMgd2hpY2ggc2F2ZSB0aGUgaWRlbnRpY2FsIGZpbGVz
LiBUaGUgc3BhY2Ugb2YgZWFjaCBwYXJ0aXRpb24gaXMgMTFNLAo+IG5vdGhpbmcgc3BlY2lhbC4K
Pgo+IFRoYW5rcy4KPgoKSSBub3RpY2VkIHRoYXQgdGhlcmUncyBhIGNyYXNoIGF0Cmh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvbGliL2x6by9sem8xeF9kZWNv
bXByZXNzX3NhZmUuYyNMMjE4CndoZW4gdGVzdGluZyBvbiBteSBzeXN0ZW0uCihJIGhhdmUgQ09O
RklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MgZW5hYmxlZCkKCkZ1bGwgbG9nczoK
WyAgMTE5LjA2MjQyMF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQg
dmlydHVhbAphZGRyZXNzIGZmZmZmZmMwMTczMzcwMDAKWyAgMTE5LjA2MjQzN10gTWVtIGFib3J0
IGluZm86ClsgIDExOS4wNjI0NDJdICAgRVNSID0gMHg5NjAwMDA0NwpbICAxMTkuMDYyNDQ3XSAg
IEVDID0gMHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cwpbICAxMTkuMDYyNDUx
XSAgIFNFVCA9IDAsIEZuViA9IDAKWyAgMTE5LjA2MjQ1NF0gICBFQSA9IDAsIFMxUFRXID0gMApb
ICAxMTkuMDYyNDU3XSBEYXRhIGFib3J0IGluZm86ClsgIDExOS4wNjI0NjBdICAgSVNWID0gMCwg
SVNTID0gMHgwMDAwMDA0NwpbICAxMTkuMDYyNDY0XSAgIENNID0gMCwgV25SID0gMQpbICAxMTku
MDYyNDY5XSBzd2FwcGVyIHBndGFibGU6IDRrIHBhZ2VzLCAzOS1iaXQgVkFzLCBwZ2RwPTAwMDAw
MDAwNDEwOTkwMDAKWyAgMTE5LjA2MjQ3M10gW2ZmZmZmZmMwMTczMzcwMDBdIHBnZD0wMDAwMDAw
MTAwMTRhMDAzLApwNGQ9MDAwMDAwMDEwMDE0YTAwMywgcHVkPTAwMDAwMDAxMDAxNGEwMDMsIHBt
ZD0wMDAwMDAwMTBiYTU5MDAzLApwdGU9MDAwMDAwMDAwMDAwMDAwMApbICAxMTkuMDYyNDg5XSBJ
bnRlcm5hbCBlcnJvcjogT29wczogOTYwMDAwNDcgWyMxXSBQUkVFTVBUIFNNUApbICAxMTkuMDYy
NDk0XSBNb2R1bGVzIGxpbmtlZCBpbjogdmhvc3RfdnNvY2sgdmhvc3Qgdmhvc3RfaW90bGIKdm13
X3Zzb2NrX3ZpcnRpb190cmFuc3BvcnRfY29tbW9uIHZzb2NrIHJmY29tbSBhbGdpZl9oYXNoCmFs
Z2lmX3NrY2lwaGVyIGFmX2FsZyB2ZXRoIHVpbnB1dCB4dF9jZ3JvdXAgbXRrX2RpcCBtdGtfY2Ft
X2lzcAptdGtfdmNvZGVjX2VuYyBtdGtfdmNvZGVjX2RlYyBoY2lfdWFydCBtdGtfZmQgbXRrX21k
cDMgdjRsMl9oMjY0Cm10a192Y29kZWNfY29tbW9uIG10a192cHUgeHRfTUFTUVVFUkFERSBtdGtf
anBlZyBjcm9zX2VjX3JwbXNnIGJ0cWNhCnZpZGVvYnVmMl9kbWFfY29udGlnIHY0bDJfZndub2Rl
IHY0bDJfbWVtMm1lbSBidHJ0bCBlbGFudHNfaTJjIG10a19zY3AKbXRrX3JwbXNnIHJwbXNnX2Nv
cmUgbXRrX3NjcF9pcGkgbXQ4MTgzX2NjaV9kZXZmcmVxIGlwNnRhYmxlX25hdCBmdXNlCjgwMjFx
IGJsdWV0b290aCBlY2RoX2dlbmVyaWMgZWNjIGlpb190cmlnX3N5c2ZzIGNyb3NfZWNfbGlkX2Fu
Z2xlCmNyb3NfZWNfc2Vuc29ycyBjcm9zX2VjX3NlbnNvcnNfY29yZSBpbmR1c3RyaWFsaW9fdHJp
Z2dlcmVkX2J1ZmZlcgprZmlmb19idWYgY3Jvc19lY19zZW5zb3JodWIgY3Jvc19lY190eXBlYyB0
eXBlYyBoaWRfZ29vZ2xlX2hhbW1lcgphdGgxMGtfc2RpbyBsem9fcmxlIGx6b19jb21wcmVzcyBh
dGgxMGtfY29yZSBhdGggbWFjODAyMTEgenJhbQpjZmc4MDIxMSB1dmN2aWRlbyB2aWRlb2J1ZjJf
dm1hbGxvYyB2aWRlb2J1ZjJfbWVtb3BzIHZpZGVvYnVmMl92NGwyCnZpZGVvYnVmMl9jb21tb24g
Y2RjX2V0aGVyIHVzYm5ldCByODE1MiBtaWkgam95ZGV2ClsgIDExOS4wNjI2MTNdIENQVTogNCBQ
SUQ6IDQxNjEgQ29tbTogY2hyb21lIFRhaW50ZWQ6IEcgICAgICAgIFcKICA1LjEwLjExMiAjMTA1
IDM5ZjExYmZmZGEyMjdlYWFlNGM3MDQ3MzNiOWJmMDFkYjIyZDhiNGQKWyAgMTE5LjA2MjYxN10g
SGFyZHdhcmUgbmFtZTogR29vZ2xlIGJ1cm5ldCBib2FyZCAoRFQpClsgIDExOS4wNjI2MjNdIHBz
dGF0ZTogMjA0MDAwMDUgKG56Q3YgZGFpZiArUEFOIC1VQU8gLVRDTyBCVFlQRT0tLSkKWyAgMTE5
LjA2MjYzNl0gcGMgOiBsem8xeF9kZWNvbXByZXNzX3NhZmUrMHgxZGMvMHg1NjQKWyAgMTE5LjA2
MjY0M10gbHIgOiBsem9fdW5jb21wcmVzcysweDEzNC8weDFmMApbICAxMTkuMDYyNjQ3XSBzcCA6
IGZmZmZmZmMwMTgzN2I4NjAKWyAgMTE5LjA2MjY1MF0geDI5OiBmZmZmZmZjMDE4MzdiODYwIHgy
ODogMDAwMDAwMDAwMDAwMDAwMApbICAxMTkuMDYyNjU2XSB4Mjc6IDAwMDAwMDAwMDAwMDU0NTEg
eDI2OiBmZmZmZmZjMDE3MWM5NDQ1ClsgIDExOS4wNjI2NjJdIHgyNTogMDAwMDAwMDAwMDAwMDAw
MCB4MjQ6IGZmZmZmZmMwMTc0MzcwMDAKWyAgMTE5LjA2MjY2OF0geDIzOiBmZmZmZmZjMDE3MWM5
NDRmIHgyMjogZmZmZmZmYzAxNzEzNjAwMApbICAxMTkuMDYyNjczXSB4MjE6IGZmZmZmZmMwMTcz
MzZmZjEgeDIwOiBmZmZmZmZjMDE3MjM3MDAwClsgIDExOS4wNjI2NzldIHgxOTogZmZmZmZmYzAx
ODM3YjhkMCB4MTg6IDAwMDAwMDAwMDAwMDAwMDAKWyAgMTE5LjA2MjY4NF0geDE3OiAwMDAwMDAw
MDAwMDAwMWViIHgxNjogMDAwMDAwMDAwMDAwMDAxMgpbICAxMTkuMDYyNjg5XSB4MTU6IDAwMDAw
MDAwMDAxMDAwMGYgeDE0OiBkNjAwMTIwMjAyMDAwMDAxClsgIDExOS4wNjI2OTVdIHgxMzogZmZm
ZmZmYzAxNzMzNmZmMSB4MTI6IGZmZmZmZmMwMTczMzZmZjQKWyAgMTE5LjA2MjcwMF0geDExOiAw
MDAwMDAwMDAwMDAwMDAyIHgxMDogMDEwMTAxMDEwMTAxMDBmZgpbICAxMTkuMDYyNzA1XSB4OSA6
IGZmZmZmZmZmZmZmZmZmZmYgeDggOiBmZmZmZmZjMDE3MWM5NDRkClsgIDExOS4wNjI3MTBdIHg3
IDogZDE1ZDNhYWFiZDI5NDMzMCB4NiA6IDAyMDYzOTcxMTVmZTI4YWIKWyAgMTE5LjA2MjcxNV0g
eDUgOiBmZmZmZmZjMDE3MWM5NDRmIHg0IDogMDAwMDAwMDAwMDA5MzQ0ZgpbICAxMTkuMDYyNzIx
XSB4MyA6IGZmZmZmZmMwMTgzN2I4ZDAgeDIgOiBmZmZmZmZjMDE3MjM3MDAwClsgIDExOS4wNjI3
MjZdIHgxIDogMDAwMDAwMDAwMDA5MzQ0ZiB4MCA6IGZmZmZmZmMwMTcxYzk0NDcKWyAgMTE5LjA2
MjczMV0gQ2FsbCB0cmFjZToKWyAgMTE5LjA2MjczOF0gIGx6bzF4X2RlY29tcHJlc3Nfc2FmZSsw
eDFkYy8weDU2NApbICAxMTkuMDYyNzQyXSAgbHpvX3VuY29tcHJlc3MrMHgxMzQvMHgxZjAKWyAg
MTE5LjA2Mjc0Nl0gIHNxdWFzaGZzX2RlY29tcHJlc3MrMHg2Yy8weGI0ClsgIDExOS4wNjI3NTNd
ICBzcXVhc2hmc19yZWFkX2RhdGErMHgxYTgvMHgyOTgKWyAgMTE5LjA2Mjc1OF0gIHNxdWFzaGZz
X3JlYWRhaGVhZCsweDMwOC8weDQ3NApbICAxMTkuMDYyNzY1XSAgcmVhZF9wYWdlcysweDc0LzB4
MjgwClsgIDExOS4wNjI3NjldICBwYWdlX2NhY2hlX3JhX3VuYm91bmRlZCsweDFkMC8weDIyOApb
ICAxMTkuMDYyNzczXSAgZG9fcGFnZV9jYWNoZV9yYSsweDQ0LzB4NTAKWyAgMTE5LjA2Mjc3OV0g
IGRvX3N5bmNfbW1hcF9yZWFkYWhlYWQrMHgxODgvMHgxYTAKWyAgMTE5LjA2Mjc4M10gIGZpbGVt
YXBfZmF1bHQrMHgxMDAvMHgzNTAKWyAgMTE5LjA2Mjc4OV0gIF9fZG9fZmF1bHQrMHg0OC8weDEw
YwpbICAxMTkuMDYyNzkzXSAgZG9fY293X2ZhdWx0KzB4NTgvMHgxMmMKWyAgMTE5LjA2Mjc5N10g
IGhhbmRsZV9tbV9mYXVsdCsweDU0NC8weDkwNApbICAxMTkuMDYyODA0XSAgZG9fcGFnZV9mYXVs
dCsweDI2MC8weDM4NApbICAxMTkuMDYyODA5XSAgZG9fdHJhbnNsYXRpb25fZmF1bHQrMHg0NC8w
eDVjClsgIDExOS4wNjI4MTNdICBkb19tZW1fYWJvcnQrMHg0OC8weGI0ClsgIDExOS4wNjI4MTld
ICBlbDBfZGErMHgyOC8weDM0ClsgIDExOS4wNjI4MjRdICBlbDBfc3luY19jb21wYXRfaGFuZGxl
cisweGI4LzB4Y2MKWyAgMTE5LjA2MjgyOV0gIGVsMF9zeW5jX2NvbXBhdCsweDE4OC8weDFjMApb
ICAxMTkuMDYyODM3XSBDb2RlOiBmOTQwMDFhZSBmOTAwMDJhZSBmOTQwMDVhZSA5MTAwNDFhZCAo
ZjkwMDA2YWUpClsgIDExOS4wNjI4NDJdIC0tLVsgZW5kIHRyYWNlIDNlOTgyOGM3MzYwZmQ3YmUg
XS0tLQpbICAxMTkuMDkwNDM2XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogT29wczogRmF0
YWwgZXhjZXB0aW9uClsgIDExOS4wOTA0NTVdIFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMK
WyAgMTE5LjA5MDQ2N10gS2VybmVsIE9mZnNldDogMHgyNzI5YzAwMDAwIGZyb20gMHhmZmZmZmZj
MDEwMDAwMDAwClsgIDExOS4wOTA0NzFdIFBIWVNfT0ZGU0VUOiAweGZmZmZmZmQ4ODAwMDAwMDAK
WyAgMTE5LjA5MDQ3N10gQ1BVIGZlYXR1cmVzOiAweDA4MjQwMDAyLDIxODgyMDBjCgoxKSBUcmFj
ZXMgbmVhciB3aGVuIHRoZSBjcmFzaCBoYXBwZW5lZDoKWyAgIDc5LjQ5NTU4MF0gQmxvY2sgQCAw
eDYwZWVhOWMsIGNvbXByZXNzZWQgc2l6ZSA2NTc0NCwgc3JjIHNpemUgMTA0ODU3NgpbICAgODAu
MzYzNTczXSBCbG9jayBAIDB4MWY5ZjAwMCwgY29tcHJlc3NlZCBzaXplIDIwMDU5OCwgc3JjIHNp
emUgMTA0ODU3NgpbICAgODAuMzcxMjU2XSBCbG9jayBAIDB4MWZjZmY5NiwgY29tcHJlc3NlZCBz
aXplIDgwNzcyLCBzcmMgc2l6ZSAxMDQ4NTc2ClsgICA4MC40MjgzODhdIEJsb2NrIEAgMHgxZmUz
YjFhLCBjb21wcmVzc2VkIHNpemUgODM5NDEsIHNyYyBzaXplIDEwNDg1NzYKWyAgIDgwLjQzNTMx
OV0gQmxvY2sgQCAweDFmZjgyZmYsIGNvbXByZXNzZWQgc2l6ZSA3NzkzNiwgc3JjIHNpemUgMTA0
ODU3NgpbICAgODAuNzI0MzMxXSBCbG9jayBAIDB4NDUwMTAwMCwgY29tcHJlc3NlZCBzaXplIDM2
NDA2OSwgc3JjIHNpemUgMTA0ODU3NgpbICAgODAuNzM4NjgzXSBCbG9jayBAIDB4NGRjY2YyOCwg
Y29tcHJlc3NlZCBzaXplIDYwMzIxNSwgc3JjIHNpemUgMjA5NzE1MgoKSXQncyBhbHNvIG5vdGlj
ZWQgdGhhdCB3aGVuIHRoZSBjcmFzaCBoYXBwZW5lZCwgbnJfcGFnZXMgb2J0YWluZWQgYnkKcmVh
ZGFoZWFkX2NvdW50KCkgaXMgNTEyLgpucl9wYWdlcyA9IHJlYWRhaGVhZF9jb3VudChyYWN0bCk7
IC8vIHRoaXMgbGluZQoKMikgTm9ybWFsIGNhc2VzIHRoYXQgd29uJ3QgY3Jhc2g6ClsgICAyMi42
NTE3NTBdIEJsb2NrIEAgMHhiM2JiY2E2LCBjb21wcmVzc2VkIHNpemUgNDIxNzIsIHNyYyBzaXpl
IDI2MjE0NApbICAgMjIuNjUzNTgwXSBCbG9jayBAIDB4YjNjNjE2MiwgY29tcHJlc3NlZCBzaXpl
IDI5ODE1LCBzcmMgc2l6ZSAyNjIxNDQKWyAgIDIyLjY1NjY5Ml0gQmxvY2sgQCAweGI0YTI5M2Ys
IGNvbXByZXNzZWQgc2l6ZSAxNzQ4NCwgc3JjIHNpemUgMTMxMDcyClsgICAyMi42NjYwOTldIEJs
b2NrIEAgMHhiNTkzODgxLCBjb21wcmVzc2VkIHNpemUgMzk3NDIsIHNyYyBzaXplIDI2MjE0NApb
ICAgMjIuNjY4Njk5XSBCbG9jayBAIDB4YjU5ZDNiZiwgY29tcHJlc3NlZCBzaXplIDM3ODQxLCBz
cmMgc2l6ZSAyNjIxNDQKWyAgIDIyLjY5NTczOV0gQmxvY2sgQCAweDEzNjk4NjczLCBjb21wcmVz
c2VkIHNpemUgNjU5MDcsIHNyYyBzaXplIDEzMTA3MgpbICAgMjIuNjk4NjE5XSBCbG9jayBAIDB4
MTM2YTg3ZTYsIGNvbXByZXNzZWQgc2l6ZSAzMTU1LCBzcmMgc2l6ZSAxMzEwNzIKWyAgIDIyLjcw
MzQwMF0gQmxvY2sgQCAweGIxYmFiZTgsIGNvbXByZXNzZWQgc2l6ZSA5OTM5MSwgc3JjIHNpemUg
MTMxMDcyClsgICAyMi43MDYyODhdIEJsb2NrIEAgMHgxNTE0YWJjNiwgY29tcHJlc3NlZCBzaXpl
IDQ2MjcsIHNyYyBzaXplIDEzMTA3MgoKbnJfcGFnZXMgYXJlIG9ic2VydmVkIHRvIGJlIDMyLCA2
NCwgMjU2Li4uIFRoZXNlIHdvbid0IGNhdXNlIGEgY3Jhc2guCk90aGVyIHZhbHVlcyAobWF4X3Bh
Z2VzLCBic2l6ZSwgYmxvY2suLi4pIGxvb2tzIG5vcm1hbAoKSSdtIG5vdCBzdXJlIHdoeSB0aGUg
Y3Jhc2ggaGFwcGVuZWQsIGJ1dCBJIHRyaWVkIHRvIG1vZGlmeSB0aGUgbWFzawpmb3IgYSBiaXQu
IEFmdGVyIG1vZGlmeWluZyB0aGUgbWFzayB2YWx1ZSB0byBiZWxvdywgdGhlIGNyYXNoIGlzIGdv
bmUKKG5yX3BhZ2VzIGFyZSA8PTI1NikuCkJhc2VkIG9uIG15IHRlc3Rpbmcgb24gYSAzMDBLIHBh
Y2sgZmlsZSwgdGhlcmUncyBubyBwZXJmb3JtYW5jZSBjaGFuZ2UuCgpkaWZmIC0tZ2l0IGEvZnMv
c3F1YXNoZnMvZmlsZS5jIGIvZnMvc3F1YXNoZnMvZmlsZS5jCmluZGV4IDIwZWM0OGNmOTdjNS4u
ZjZkOWI2Zjg4ZWQ5IDEwMDY0NAotLS0gYS9mcy9zcXVhc2hmcy9maWxlLmMKKysrIGIvZnMvc3F1
YXNoZnMvZmlsZS5jCkBAIC00OTksOCArNDk5LDggQEAgc3RhdGljIHZvaWQgc3F1YXNoZnNfcmVh
ZGFoZWFkKHN0cnVjdApyZWFkYWhlYWRfY29udHJvbCAqcmFjdGwpCiB7CiAgICAgICAgc3RydWN0
IGlub2RlICppbm9kZSA9IHJhY3RsLT5tYXBwaW5nLT5ob3N0OwogICAgICAgIHN0cnVjdCBzcXVh
c2hmc19zYl9pbmZvICptc2JsayA9IGlub2RlLT5pX3NiLT5zX2ZzX2luZm87Ci0gICAgICAgc2l6
ZV90IG1hc2sgPSAoMVVMIDw8IG1zYmxrLT5ibG9ja19sb2cpIC0gMTsKICAgICAgICBzaXplX3Qg
c2hpZnQgPSBtc2Jsay0+YmxvY2tfbG9nIC0gUEFHRV9TSElGVDsKKyAgICAgICBzaXplX3QgbWFz
ayA9ICgxVUwgPDwgc2hpZnQpIC0gMTsKCgpBbnkgcG9pbnRlcnMgYXJlIGFwcHJlY2lhdGVkLiBU
aGFua3MhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
U3F1YXNoZnMtZGV2ZWwgbWFpbGluZyBsaXN0ClNxdWFzaGZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9zcXVh
c2hmcy1kZXZlbAo=
