Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E52523D9F
	for <lists+squashfs-devel@lfdr.de>; Wed, 11 May 2022 21:35:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nos7O-00072H-HR; Wed, 11 May 2022 19:35:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sxwjean@gmail.com>) id 1noP1S-0007Qn-5k
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 12:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5szIJGzV0jSwpdMcVThWBXZCjy3WCoA0MTb2LX3xhCM=; b=lRRYxrIZiwwaxUgmtk1VwDKx8N
 fn/pJU03j+2i8/3YFxMh2MQ6de2fOUbJduUhDvpDPDniQpO/1ShstOQh4aTxrQha1k0IMqO/d+Yd2
 wcmbdWUb5XZly59vkpuZY5a6KWVYAT/jekDTqg4xbQzZLe8hTMIP0x3VK5CUb5x+elqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5szIJGzV0jSwpdMcVThWBXZCjy3WCoA0MTb2LX3xhCM=; b=GeoPUNYfkWK68CR44iCXVmLXFu
 I74OndtwqPLTBixM9faZqc2mZlbXPYCbxW1Bm/fGuQEX4nXnFJgkHjXoCAmb8pHjm4TNHM25TZE8+
 tMvjrMuTPObeDCcvXMLxFOm6RZRejEJoAd3V9R2L+vu7QF8Jotpfv5WGavJFguH++FlQ=;
Received: from mail-pg1-f173.google.com ([209.85.215.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1noP1O-007lAn-UI
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 12:31:24 +0000
Received: by mail-pg1-f173.google.com with SMTP id t13so14515701pgn.8
 for <squashfs-devel@lists.sourceforge.net>;
 Tue, 10 May 2022 05:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5szIJGzV0jSwpdMcVThWBXZCjy3WCoA0MTb2LX3xhCM=;
 b=XdXho14QbkW4+7KXZQm31h4NDObx1KZJaVmm+Wi/4imUCJ5/V5Grjl3XyGiy+w04kM
 2xInfGisbMeQ0Gzl1A/45vw+BoJ0bbWEX5RBkjgFGKmOlDU1UlBRqukA6VQ5+PriiTf0
 5ZVMmwyhWAVl0pJ+1DkhrsWmh5FNTbjbf3T7pWYSqo6Lll7MaqhtODnmk86PcLqFtbbS
 +UreMTh2UO4LNLdfFBqKvkkz7+T5DRRkOKz/NaAa3GffN1v9zzrPwiT/ejfeytBldU/d
 gek+hMa0LuDNmW34pEhwrl+80zQJyzJ+02byc9R48q4xM2C1aVldCkfW5d4DTtF7VZgA
 qoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5szIJGzV0jSwpdMcVThWBXZCjy3WCoA0MTb2LX3xhCM=;
 b=V6etXs8sPFjSvT7BQG3e/CwdPfA08gUgsS+P0Z0v9y+bepLm6hUtEYf69yNtZsEYFS
 tIa4Oz3tSY4KJBYAUTv/u5b2rYrBtj0mRozZvCaGuZPN2apJk31YGNASd5uxpiaLPDAr
 eN17ZYYY0ru9VTtKsXQKq9bxfWAvj4Fz2QhIXJIQWIkT4HpoftBP6GkMoEFr5O+0lTh7
 oFgSmHH0/EK7V5Z34AZ0E93YmElnnVgPJG8IPvf8z/AWyExaLU8H62zQqA5h4oqQcVk/
 WrFgHn2yIKPzh5A2ZYVtRgcCkeC/W9hnTBGg2+7HyNhgYOqdNGJQWPflPFBWEVx2U9Ma
 whCg==
X-Gm-Message-State: AOAM533W6oFvyKIyxcguqrXoK6YkNukWeDGvK1kc9BCNSG2CDl6rT/ID
 /l1Cwp1vUv6MlxBxqTMK4wNRzJR0Hf6PHJP+Rk4=
X-Google-Smtp-Source: ABdhPJzrJCardUGNn0sRK4dh3zHTqkuzQjE0rpQ0gLzRUFv9JP5rBqD5GG+VE5m4pT9XfMJgMd7sfjOqSGlpE7tATdU=
X-Received: by 2002:a05:6a00:244a:b0:4fa:ebf9:75de with SMTP id
 d10-20020a056a00244a00b004faebf975demr20427580pfj.73.1652185877343; Tue, 10
 May 2022 05:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
In-Reply-To: <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Tue, 10 May 2022 20:30:50 +0800
Message-ID: <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Hsin-Yi, On Mon, May 9,
 2022 at 10:29 PM Hsin-Yi Wang wrote:
 > > On Mon, May 9, 2022 at 9:21 PM Matthew Wilcox wrote: > > > > On Mon,
 May 09, 2022 at 08:43:45PM +0800, Xiongwei Song wrote: > > > Hi Hsin-Yi [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.173 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sxwjean[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1noP1O-007lAn-UI
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

SGkgSHNpbi1ZaSwKCk9uIE1vbiwgTWF5IDksIDIwMjIgYXQgMTA6MjkgUE0gSHNpbi1ZaSBXYW5n
IDxoc2lueWlAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTWF5IDksIDIwMjIgYXQg
OToyMSBQTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+
ID4gT24gTW9uLCBNYXkgMDksIDIwMjIgYXQgMDg6NDM6NDVQTSArMDgwMCwgWGlvbmd3ZWkgU29u
ZyB3cm90ZToKPiA+ID4gSGkgSHNpbi1ZaSBhbmQgTWF0dGhldywKPiA+ID4KPiA+ID4gV2l0aCB0
aGUgcGF0Y2ggZnJvbSB0aGUgYXR0YWNobWVudCBvbiBsaW51eCA1LjEwLCByYW4gdGhlIGNvbW1h
bmQgYXMgSQo+ID4gPiBtZW50aW9uZWQgZWFybGllciwKPiA+ID4gZ290IHRoZSByZXN1bHRzIGJl
bG93Ogo+ID4gPiAxOjQwLjY1ICgxbSArIDQwLjY1cykKPiA+ID4gMToxMC4xMgo+ID4gPiAxOjEx
LjEwCj4gPiA+IDE6MTEuNDcKPiA+ID4gMToxMS41OQo+ID4gPiAxOjExLjk0Cj4gPiA+IDE6MTEu
ODYKPiA+ID4gMToxMi4wNAo+ID4gPiAxOjEyLjIxCj4gPiA+IDE6MTIuMDYKPiA+ID4KPiA+ID4g
VGhlIHBlcmZvcm1hbmNlIGhhcyBpbXByb3ZlZCBvYnZpb3VzbHksIGJ1dCBjb21wYXJlZCB0byBs
aW51eCA0LjE4LCB0aGUKPiA+ID4gcGVyZm9ybWFuY2UgaXMgbm90IHNvIGdvb2QuCj4gPiA+Cj4g
SSB0aGluayB5b3Ugc2hvdWxkbid0IGNvbXBhcmUgdGhlIHBlcmZvcm1hbmNlIHdpdGggNC4xOCBk
aXJlY3RseSwKPiBzaW5jZSB0aGVyZSBtaWdodCBiZSBvdGhlciBmYWN0b3JzIHRoYXQgaW1wYWN0
IHRoZSBwZXJmb3JtYW5jZS4KCk1ha2Ugc2Vuc2UuCgo+SSdkIHN1Z2dlc3QgY29tcGFyaW5nIHRo
ZSBzYW1lIGtlcm5lbCB2ZXJzaW9uIHdpdGg6Cj4gYSkgd2l0aCB0aGlzIHBhdGNoCj4gYikgd2l0
aCBjMWY2OTI1ZTEwOTEgKCJtbTogcHV0IHJlYWRhaGVhZCBwYWdlcyBpbiBjYWNoZSBlYXJsaWVy
IikgcmV2ZXJ0ZWQuCgpXaXRoIDllZWMxZDg5NzEzOSAoInNxdWFzaGZzOiBwcm92aWRlIGJhY2tp
bmdfZGV2X2luZm8gaW4gb3JkZXIgdG8gZGlzYWJsZQpyZWFkLWFoZWFkIikgcmV2ZXJ0ZWQgYW5k
IGFwcGxpZWQgMDAwMS1XSVAtc3F1YXNoZnMtaW1wbGVtZW50LXJlYWRhaGVhZC5wYXRjaCwKdGVz
dCByZXN1bHQgb24gbGludXggNS4xOO+8mgoxOjQxLjUxICgxbSArIDQxLjUxcykKMTowOC4xMQox
OjEwLjM3CjE6MTEuMTcKMToxMS4zMgoxOjExLjU5CjE6MTIuMjMKMToxMi4wOAoxOjEyLjc2CjE6
MTIuNTEKCnBlcmZvcm1hbmNlIHdvcnNlIDEgfiAycyB0aGFuIGxpbnV4IDUuMTggdmFuaWxsYS4K
Cj4KPiBBY2NvcmRpbmcgdG8gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vWW5memgy
aWZHODVNWkVvTkBjYXNwZXIuaW5mcmFkZWFkLm9yZy90Lwo+IEl0IHNlZW1zIHRvIGJlIGEgMyBz
ZWMgZGlmZmVyZW5jZT8KCjUgfiA2cyBkaWZmZXJlbmNlLgoKUmVnYXJkcywKWGlvbmd3ZWkKCj4K
PiAxOjM3LjE2ICgxbSArIDM3LjE2cykKPiAxOjA0LjE4Cj4gMTowNS4yOAo+IDE6MDYuMDcKPiAx
OjA2LjMxCj4gMTowNi41OAo+IDE6MDYuODAKPiAxOjA2Ljc5Cj4gMTowNi45NQo+IDE6MDYuNjEK
Pgo+ID4gPiBNb3Jlb3ZlciwgSSB3YW50ZWQgdG8gdGVzdCBvbiBsaW51eCA1LjE4LiBCdXQgSSB0
aGluayBJIHNob3VsZCByZXZlcnQKPiA+ID4gOWVlYzFkODk3MTM5ICgic3F1YXNoZnM6IHByb3Zp
ZGUgYmFja2luZ19kZXZfaW5mbyBpbiBvcmRlciB0byBkaXNhYmxlCj4gPiA+IHJlYWQtYWhlYWQi
KSwKPiA+ID4gcmlnaHQ/ICBPdGhlcndpc2UsIHRoZSBwYXRjaCBkb2Vzbid0IHdvcms/Cj4gPgo+
ID4gSSd2ZSBuZXZlciBzZWVuIHBhdGNoIDllZWMxZDg5NzEzOSBiZWZvcmUuICBJZiB5b3UncmUg
Z29pbmcgdG8gcG9pbnQKPiA+IG91dCBidWdzIGluIG15IGNvZGUsIGF0IGxlYXN0IGhhdmUgdGhl
IGRlY2VuY3kgdG8gY2MgbWUgb24gaXQuICBJdAo+ID4gc2hvdWxkIG5ldmVyIGhhdmUgZ29uZSBp
biwgYW5kIHNob3VsZCBiZSByZXZlcnRlZCBzbyB0aGUgcHJvYmxlbSBjYW4KPiA+IGJlIGZpeGVk
IHByb3Blcmx5LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClNxdWFzaGZzLWRldmVsIG1haWxpbmcgbGlzdApTcXVhc2hmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
c3F1YXNoZnMtZGV2ZWwK
