Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D07FA7F37C
	for <lists+squashfs-devel@lfdr.de>; Tue,  8 Apr 2025 06:19:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1u20R0-0002Hv-AT;
	Tue, 08 Apr 2025 04:19:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1u20Qz-0002He-0T
 for squashfs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 04:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1c1u7ow1G/EprObynHadb20wtX4BcR/gBTYWAZzXlyo=; b=aOrLHoEB90d7z4BeVoouMGxCRh
 d/SoAtvcQXEmdgNLDXgRVbgYKmsbb2xw1bn0OuWKzfUDfsC+o3TSWkU6h2G1kDOjDZCJ1tZtqVNa8
 /6Pu9ahEP8Tc4DOGuyvjuOS4sYSOL8Qx3gITEUTq5P5avT8euOfb52JMJ2f3Y0GWpVl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1c1u7ow1G/EprObynHadb20wtX4BcR/gBTYWAZzXlyo=; b=YiVDJCxRZPN2ZOoNx+kGpLfIze
 FJDLR38djrFG08SjtlLjyE0i8IfZO/4msE4EiFaAs6iQhNqaUiRtYa5TFKoRoexQQr2K2dzUZWNxA
 PxBhjzY2/jKAQplauFM1Dkavy4o8aqqieN3KvxdTwhRTbYa60vn9zdmfxfvPKHs4qrYA=;
Received: from sxb1plsmtpa01-11.prod.sxb1.secureserver.net ([188.121.53.115])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u20Qg-0008DP-Ae for squashfs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 04:19:37 +0000
Received: from [192.168.178.95] ([82.69.79.175]) by :SMTPAUTH: with ESMTPSA
 id 20QJuoRE2oGJS20QLu2IJY; Mon, 07 Apr 2025 21:18:58 -0700
X-CMAE-Analysis: v=2.4 cv=A9SWP7WG c=1 sm=1 tr=0 ts=67f4a3b3
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=TieKIuElshfLa7FaqJMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <129d4f39-6922-44e9-8b1c-6455ee564dda@squashfs.org.uk>
Date: Tue, 8 Apr 2025 05:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com
References: <67f1f6f6.050a0220.0a13.025a.GAE@google.com>
 <2a13ea1c-08df-4807-83d4-241831b7a2ec@squashfs.org.uk>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <2a13ea1c-08df-4807-83d4-241831b7a2ec@squashfs.org.uk>
X-CMAE-Envelope: MS4xfGE8bUnGjcLYUEYUFnE1digrUscMj8xkIdWUdEFjNBEikMOPckN6nMJ0AO0Ls+42hZzAfWoRygr2tbJAsWpCWsIHA5iks5fG9L6RBHZSUohcJUnaaArh
 T19VmDmx20WB93dE2LUc2vDBqz4I6+37hBV81ZUir8RX6K3Z2nKEdLfGcXuydbtT3xeqGnSGyWep1yJZQaYBi6E6eKQNtu6+ogTg1BoDOts6UQLlVZctMhWq
 lvIak6Vlk9Cezu4xywEpa+/t7XkCRCnAVYe5weqx9X+wpQ7BDThGFfAmN75jCirogNaZq637suM5DKEI7YtnxmXm0ueJkP88un9m/9cIO3KhTOW4t35scjXS
 1urR6u+LWhftN3Ewb2nwJzqFdarDAbhuMUCgsrvP+NXJT/4BYP8TeE8p7zh2W5x07DEyO5tWxo9SHHSk6cY8SSQtpAtS49cL9opv2AykPYxyNshuhobu9wpT
 p03vISfFa0HXP6cnrshr0/7W5K4oArbF5N0IEw==
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/04/2025 06:30, Phillip Lougher wrote: > Digging deeper
 into the reproducer,
 it turns out the reproducer is > forking multiple processes
 which after mounting the Squashfs filesystem, > issues a LOOP_SET_BLOCK_SIZE(r0,
 0x4c09, 0x8000) ioctl [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [188.121.53.115 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [188.121.53.115 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [188.121.53.115 listed in wl.mailspike.net]
X-Headers-End: 1u20Qg-0008DP-Ae
Subject: Re: [Squashfs-devel] [syzbot] [squashfs?] UBSAN:
 shift-out-of-bounds in squashfs_bio_read
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
Cc: squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, squashfs-devel-owner@lists.sourceforge.net,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

T24gMDcvMDQvMjAyNSAwNjozMCwgUGhpbGxpcCBMb3VnaGVyIHdyb3RlOgoKPiBEaWdnaW5nIGRl
ZXBlciBpbnRvIHRoZSByZXByb2R1Y2VyLCBpdCB0dXJucyBvdXQgdGhlIHJlcHJvZHVjZXIgaXMK
PiBmb3JraW5nIG11bHRpcGxlIHByb2Nlc3NlcyB3aGljaCBhZnRlciBtb3VudGluZyB0aGUgU3F1
YXNoZnMgZmlsZXN5c3RlbSwKPiBpc3N1ZXMgYSBMT09QX1NFVF9CTE9DS19TSVpFKHIwLCAweDRj
MDksIDB4ODAwMCkgaW9jdGwgb24gbG9vcGJhY2sKPiBkZXZpY2UgL2Rldi9sb29wMC7CoCBOb3cs
IGlmIHRoaXMgaW9jdGwgb2NjdXJzIGF0IHRoZSBzYW1lIHRpbWUgYW5vdGhlcgo+IHByb2Nlc3Mg
aXMgaW4gdGhlIHByb2Nlc3Mgb2YgbW91bnRpbmcgYSBTcXVhc2hmcyBmaWxlc3lzdGVtIG9uCj4g
L2Rldi9sb29wMCwgdGhlIGZhaWx1cmUgb2NjdXJzLsKgwqAgVGhlIGlvY3RsIGhhcyB0byBiZSBp
c3N1ZWQgaW4gdGhlCj4gZWFybHkgcGFydCBvZiBzcXVhc2hmc19maWxsX3N1cGVyKCkgYmVmb3Jl
IHRoZSBzdXBlcmJsb2NrIGhhcyBiZWVuIHJlYWQuCj4gV2hlbiB0aGlzIGhhcHBlbnMsIHRoZSBm
b2xsb3dpbmcgY29kZSBpbiBzcXVhc2hmc19maWxsX3N1cGVyKCkgZmFpbHMuCj4gCj4gLS0tLQo+
IG1zYmxrLT5kZXZibGtzaXplID0gc2JfbWluX2Jsb2Nrc2l6ZShzYiwgU1FVQVNIRlNfREVWQkxL
X1NJWkUpOwo+IG1zYmxrLT5kZXZibGtzaXplX2xvZzIgPSBmZnoofm1zYmxrLT5kZXZibGtzaXpl
KTsKPiAtLS0tCj4gCj4gc2JfbWluX2Jsb2Nrc2l6ZSgpIHJldHVybnMgMCwgd2hpY2ggbWVhbnMg
bXNibGstPmRldmJsa3NpemUgaXMgc2V0IHRvIDAuCgpDQydpbmcgTHVpcyBDaGFtYmVybGFpbiA8
bWNncm9mQGtlcm5lbC5vcmc+CgpEb2luZyBzb21lIG1vcmUgZGlnZ2luZywgd2hhdCBoYXMgY2hh
bmdlZCB0byBjYXVzZSB0aGlzIGZhaWx1cmUsIGlzIGEKcG9zdCA2LjE0IGNoYW5nZSBpbiB0aGUg
YmVoYXZpb3VyIG9mIHRoZSBMT09QX1NFVF9CTE9DS19TSVpFIGlvY3RsLgoKRG9pbmcgYSBnaXQg
YmlzZWN0LCBwcmlvciB0byBjb21taXQgNDdkZDY3NTMyMzAzODAzYTg3ZjQzMTk1ZTA4OGIzYjRi
Y2YwNDU0ZApBdXRob3I6IEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPgpibG9j
ay9iZGV2OiBsaWZ0IGJsb2NrIHNpemUgcmVzdHJpY3Rpb25zIHRvIDY0awoKQXR0ZW1wdHMgdG8g
c2V0IHRoZSBsb29wYmFjayBkZXZpY2UgYmxvY2sgc2l6ZSB0byAweDgwMDAgKDMyNzY4KSBmYWls
ZWQuCkFmdGVyIHRoZSBhYm92ZSBjb21taXQsIHN1Y2ggYXR0ZW1wdHMgc3VjY2VlZC4gIEhhdmlu
ZyBkb25lIHNvLCB0aGlzCmNhdXNlcyB0aGUgYWJvdmUgc2JfbWluX2Jsb2Nrc2l6ZShzYiwgU1FV
QVNIRlNfREVWQkxLX1NJWkUpIHRvIGZhaWwuCgpUaGlzIG1heSBiZSBhbiB1bmFudGljaXBhdGVk
IHNpZGUgZWZmZWN0IG9mIHRoZSBjaGFuZ2UuCgpDaGVja2luZyB0aGUga2VybmVsIGNvZGUgc2l4
IGZpbGVzeXN0ZW1zIGZhaWwgdG8gY2hlY2sgdGhlIHJldHVybgpyZXN1bHQgb2Ygc2JfbWluX2Js
b2Nrc2l6ZSAoaXNvZnMsIGdmczIsIGV4ZmF0LCBmYXQsIHNxdWFzaGZzIGFuZCB4ZnMpLAphbmQg
c28gd2lsbCBiZSBhZmZlY3RlZCBieSB0aGlzIGNoYW5nZS4KCkJ1dCBub3R3aXRoc3RhbmRpbmcg
dGhlIGFib3ZlLCB0aGUgZmFpbHVyZSB0byBjaGVjayB0aGUgcmV0dXJuIHJlc3VsdCBvZgpzYl9t
aW5fYmxvY2tzaXplKCkgaW4gU3F1YXNoZnMgaXMgYSBidWcsIGFuZCBJIHdpbGwgc2VuZCBhIHBh
dGNoIHRoYXQKZml4ZXMgdGhpcyBhbmQgdGhlIHN5emJvdCBleHBsb2l0LiAgSG9wZWZ1bGx5IHRo
aXMgd2lsbCBiZSB0b21vcnJvdy4KClBoaWxsaXAKCj4gCj4gQXMgYSByZXN1bHQsIGZmeih+bXNi
bGstPmRldmJsa3NpemUpIHJldHVybnMgNjQsIGFuZAo+IG1zYmxrLT5kZXZibGtzaXplX2xvZzIg
aXMgc2V0IHRvIDY0Lgo+IAo+IFRoaXMgc3Vic2VxdWVudGx5IGNhdXNlcyB0aGUKPiAKPiBVQlNB
Tjogc2hpZnQtb3V0LW9mLWJvdW5kcyBpbiBmcy9zcXVhc2hmcy9ibG9jay5jOjE5NTozNgo+IHNo
aWZ0IGV4cG9uZW50IDY0IGlzIHRvbyBsYXJnZSBmb3IgNjQtYml0IHR5cGUgJ3U2NCcgKGFrYSAn
dW5zaWduZWQgbG9uZyBsb25nJykKPiAKPiBUaGUgZml4IGlzIHRvIGNoZWNrIGZvciBhIDAgcmV0
dXJuIGJ5IHNiX21pbl9ibG9ja3NpemUoKS4KPiAKPiBJJ2xsIHNlbmQgYSBwYXRjaCB0b21vcnJv
dy4KPiAKPiBQaGlsbGlwCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KU3F1YXNoZnMtZGV2ZWwgbWFpbGluZyBsaXN0ClNxdWFzaGZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9zcXVhc2hmcy1kZXZlbAo=
