Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D7C7E9FF0
	for <lists+squashfs-devel@lfdr.de>; Mon, 13 Nov 2023 16:28:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1r2YrI-0007Ni-JG;
	Mon, 13 Nov 2023 15:28:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip.lougher@gmail.com>) id 1r2YrG-0007Nc-Fg
 for squashfs-devel@lists.sourceforge.net;
 Mon, 13 Nov 2023 15:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UXXwfcUDwpePc6/RaKxPwgpcjuzDrZJ4e70MRkf6yck=; b=QZG2UgdF43QuPhQUOWrDSkeadx
 hNAja7EFZdbRP5PKSufa5COiLh2yJaWYWGmpYMrEJ9txdK1SUZs3OMiglNHEwj20Kf3FSPRpU0KTv
 +dRo2jMKWZNOqXCQDjsehHQ1l6XM8wRvVxp6KdIgpZd+0+ZPwQcMRigKI96rYWawK/Io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UXXwfcUDwpePc6/RaKxPwgpcjuzDrZJ4e70MRkf6yck=; b=XhMfH3pqOpvKBpyIYE7HZpUy48
 FwsImcQhAj0F+WmhHtTN1uyacGJ0TsJCLWuukmRlsxOdZ2UpbEzS+yc+c3Vj36wYg99LHIZsNv4ij
 FP4C1ia5nKRcGLR4O37p8Qllu5Ita2EIvv1hcRQRoST+J3fmXfp/bQUGayYeWGPZ1dLI=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r2YrF-004nz4-VH for squashfs-devel@lists.sourceforge.net;
 Mon, 13 Nov 2023 15:28:14 +0000
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-28120aa1c24so3539719a91.0
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 13 Nov 2023 07:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699889288; x=1700494088; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UXXwfcUDwpePc6/RaKxPwgpcjuzDrZJ4e70MRkf6yck=;
 b=Kjx82imkEURjfOInfq8wtkezfhbJjLMt5ZS6E3HtARg1bJe9ld3Tt5VO0MLkhN6Axt
 Ykt1C/Zt7HI5auJieWx2GEySagzOiMOmF9qt3Ht/B84zbDPkc/DGCIKO2J+UvAz41oaZ
 vtxgi2HpQIM4J1x/SGx52oAbq7R1t+7+Rrt5O109leqHw3UEVTftiCgdjszPiRYWsErP
 Glffl24Gup5kQkL+dKJxRRlGEOgzYPSyaNCzdKK95ZLqGc76NaOo01FgtHiETj9WtHgG
 h1mYoJNvcVlLtfNKvsg/0dRJZ7sxBF/v29WzeD+dUvy0p5ztf6G7az5y+VGq9v5JRnCS
 yFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699889288; x=1700494088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UXXwfcUDwpePc6/RaKxPwgpcjuzDrZJ4e70MRkf6yck=;
 b=ijb7n6XmLDjIesdmU3zMg9MONfrfTOFviwMM3HEEmXa15p3STSYXliNnEXjjvrL3yU
 mBF4hO4Y9M+qBA3+Pey6BrAJEsksrPPYPXxveQhU29nMoivQSTFK27Oe+HwNDC9efKaR
 X+XMg1MIerx48iZWVf0XQkj7fxmhOaM0vlB7rWu135/goJtwE6Dq+OkOu+VSmApg31Tb
 2NBof1N7LreRQKlhXBzyt88cyzQQv64SInG2vmRqbXophCEIqD2OkXVMIupz4HOblPEn
 YDCLd4jNv7bhULrVhA0ZYozRw0NatKb4FUkb8C+GYgiP2y41fVt1a5qMvIJ1GuhPZwNZ
 qklA==
X-Gm-Message-State: AOJu0Yx+uzNcDxP0/rUZbHX7F4uf53uqN5/iyzeuNTcjC23gIQCRtkk0
 Xu+U+Uf4+nBYOl31tC21oti1DqveIUGf9ruE5I0=
X-Google-Smtp-Source: AGHT+IEXKtS3EBTSsm4bi1dP8SKBlowvB+RrkqOHUqG9TgRDiyG0DttJxv8cLUQGb7HUoYWsOW3t3yS/hytbwPV/sGQ=
X-Received: by 2002:a17:90a:e7d0:b0:27f:f655:e14c with SMTP id
 kb16-20020a17090ae7d000b0027ff655e14cmr4591902pjb.42.1699889288150; Mon, 13
 Nov 2023 07:28:08 -0800 (PST)
MIME-Version: 1.0
References: <000000000000b1fda20609ede0d1@google.com>
In-Reply-To: <000000000000b1fda20609ede0d1@google.com>
From: Phillip Lougher <phillip.lougher@gmail.com>
Date: Mon, 13 Nov 2023 15:27:54 +0000
Message-ID: <CAB3wodfX_aO+ZLULPxnXbFM8UK4F30Q6pHaVn6U4X4TdiOzYbw@mail.gmail.com>
To: syzbot <syzbot+604424eb051c2f696163@syzkaller.appspotmail.com>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Nov 12, 2023 at 5:32 AM syzbot wrote: > > Hello,
    > > syzbot found the following issue on: > > HEAD commit: 13d88ac54ddd Merge
    tag 'vfs-6.7.fsid' of git://git.kernel... > git tree: upstream [...] 
 
 Content analysis details:   (2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.216.44 listed in list.dnswl.org]
  2.5 SORTED_RECIPS          Recipient list is sorted by address
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [phillip.lougher[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.216.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1r2YrF-004nz4-VH
Subject: Re: [Squashfs-devel] [syzbot] [squashfs?] KASAN: slab-out-of-bounds
 Write in squashfs_readahead (2)
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
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBOb3YgMTIsIDIwMjMgYXQgNTozMuKAr0FNIHN5emJvdAo8c3l6Ym90KzYwNDQyNGVi
MDUxYzJmNjk2MTYzQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGVsbG8s
Cj4KPiBzeXpib3QgZm91bmQgdGhlIGZvbGxvd2luZyBpc3N1ZSBvbjoKPgo+IEhFQUQgY29tbWl0
OiAgICAxM2Q4OGFjNTRkZGQgTWVyZ2UgdGFnICd2ZnMtNi43LmZzaWQnIG9mIGdpdDovL2dpdC5r
ZXJuZWwuLi4KPiBnaXQgdHJlZTogICAgICAgdXBzdHJlYW0KPiBjb25zb2xlK3N0cmFjZTogaHR0
cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTIxOTY1ZWY2ODAwMDAKPiBr
ZXJuZWwgY29uZmlnOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC8uY29uZmlnP3g9
YmViMzJhNTk4ZmQ3OWRiOQo+IGRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS9idWc/ZXh0aWQ9NjA0NDI0ZWIwNTFjMmY2OTYxNjMKPiBjb21waWxlcjogICAgICAg
RGViaWFuIGNsYW5nIHZlcnNpb24gMTUuMC42LCBHTlUgbGQgKEdOVSBCaW51dGlscyBmb3IgRGVi
aWFuKSAyLjQwCj4gc3l6IHJlcHJvOiAgICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvcmVwcm8uc3l6P3g9MTJiNDBjN2I2ODAwMDAKPiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTBmNjkxZWY2ODAwMDAKPgo+IERvd25s
b2FkYWJsZSBhc3NldHM6Cj4gZGlzayBpbWFnZTogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMu
Y29tL3N5emJvdC1hc3NldHMvOWU4MWRjNDkwM2MyL2Rpc2stMTNkODhhYzUucmF3Lnh6Cj4gdm1s
aW51eDogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL3N5emJvdC1hc3NldHMvZjQwZmQ3
MzI2YjNmL3ZtbGludXgtMTNkODhhYzUueHoKPiBrZXJuZWwgaW1hZ2U6IGh0dHBzOi8vc3RvcmFn
ZS5nb29nbGVhcGlzLmNvbS9zeXpib3QtYXNzZXRzLzJmMzk5Y2Q2ZmY3ZC9iekltYWdlLTEzZDg4
YWM1Lnh6Cj4gbW91bnRlZCBpbiByZXBybzogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29t
L3N5emJvdC1hc3NldHMvOGUxMjdjNjQ1YTA0L21vdW50XzAuZ3oKPgo+IFRoZSBpc3N1ZSB3YXMg
YmlzZWN0ZWQgdG86Cj4KPiBjb21taXQgZjI2OGVlZGRkZjM1OTVlODVmODg4M2RjNTBhZWQyOTY1
NDc4NTY5Ngo+IEF1dGhvcjogUGhpbGxpcCBMb3VnaGVyIDxwaGlsbGlwQHNxdWFzaGZzLm9yZy51
az4KPiBEYXRlOiAgIFNhdCBKdW4gMTEgMDM6MjE6MzIgMjAyMiArMDAwMAo+Cj4gICAgIHNxdWFz
aGZzOiBleHRlbmQgInBhZ2UgYWN0b3IiIHRvIGhhbmRsZSBtaXNzaW5nIHBhZ2VzCgpGaXhlZCB0
aGUgaXNzdWUsIGFuZCB3aWxsIHNlbmQgYSBwYXRjaCBzaG9ydGx5LgoKUGhpbGxpcAoKPgo+IGJp
c2VjdGlvbiBsb2c6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2Jpc2VjdC50eHQ/
eD0xMjUyYjcxNzY4MDAwMAo+IGZpbmFsIG9vcHM6ICAgICBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS94L3JlcG9ydC50eHQ/eD0xMTUyYjcxNzY4MDAwMAo+IGNvbnNvbGUgb3V0cHV0OiBo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xNjUyYjcxNzY4MDAwMAo+
Cj4gSU1QT1JUQU5UOiBpZiB5b3UgZml4IHRoZSBpc3N1ZSwgcGxlYXNlIGFkZCB0aGUgZm9sbG93
aW5nIHRhZyB0byB0aGUgY29tbWl0Ogo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNjA0NDI0ZWIwNTFj
MmY2OTYxNjNAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+IEZpeGVzOiBmMjY4ZWVkZGRmMzUg
KCJzcXVhc2hmczogZXh0ZW5kICJwYWdlIGFjdG9yIiB0byBoYW5kbGUgbWlzc2luZyBwYWdlcyIp
Cj4KPiBTUVVBU0hGUyBlcnJvcjogVW5hYmxlIHRvIHJlYWQgbWV0YWRhdGEgY2FjaGUgZW50cnkg
WzZmYV0KPiBTUVVBU0hGUyBlcnJvcjogVW5hYmxlIHRvIHJlYWQgbWV0YWRhdGEgY2FjaGUgZW50
cnkgWzZmYV0KPiBTUVVBU0hGUyBlcnJvcjogVW5hYmxlIHRvIHJlYWQgbWV0YWRhdGEgY2FjaGUg
ZW50cnkgWzZmYV0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KPiBCVUc6IEtBU0FOOiBzbGFiLW91dC1vZi1ib3VuZHMg
aW4gX19yZWFkYWhlYWRfYmF0Y2ggaW5jbHVkZS9saW51eC9wYWdlbWFwLmg6MTM2NCBbaW5saW5l
XQo+IEJVRzogS0FTQU46IHNsYWItb3V0LW9mLWJvdW5kcyBpbiBzcXVhc2hmc19yZWFkYWhlYWQr
MHg5YTYvMHgyMGQwIGZzL3NxdWFzaGZzL2ZpbGUuYzo1NjkKPiBXcml0ZSBvZiBzaXplIDggYXQg
YWRkciBmZmZmODg4MDFlMzkzNjQ4IGJ5IHRhc2sgc3l6LWV4ZWN1dG9yMTAwLzUwNjcKPgo+IENQ
VTogMSBQSUQ6IDUwNjcgQ29tbTogc3l6LWV4ZWN1dG9yMTAwIE5vdCB0YWludGVkIDYuNi4wLXN5
emthbGxlci0xNTE1Ni1nMTNkODhhYzU0ZGRkICMwCj4gSGFyZHdhcmUgbmFtZTogR29vZ2xlIEdv
b2dsZSBDb21wdXRlIEVuZ2luZS9Hb29nbGUgQ29tcHV0ZSBFbmdpbmUsIEJJT1MgR29vZ2xlIDEw
LzA5LzIwMjMKPiBDYWxsIFRyYWNlOgo+ICA8VEFTSz4KPiAgX19kdW1wX3N0YWNrIGxpYi9kdW1w
X3N0YWNrLmM6ODggW2lubGluZV0KPiAgZHVtcF9zdGFja19sdmwrMHgxZTcvMHgyZDAgbGliL2R1
bXBfc3RhY2suYzoxMDYKPiAgcHJpbnRfYWRkcmVzc19kZXNjcmlwdGlvbiBtbS9rYXNhbi9yZXBv
cnQuYzozNjQgW2lubGluZV0KPiAgcHJpbnRfcmVwb3J0KzB4MTYzLzB4NTQwIG1tL2thc2FuL3Jl
cG9ydC5jOjQ3NQo+ICBrYXNhbl9yZXBvcnQrMHgxNDIvMHgxNzAgbW0va2FzYW4vcmVwb3J0LmM6
NTg4Cj4gIF9fcmVhZGFoZWFkX2JhdGNoIGluY2x1ZGUvbGludXgvcGFnZW1hcC5oOjEzNjQgW2lu
bGluZV0KPiAgc3F1YXNoZnNfcmVhZGFoZWFkKzB4OWE2LzB4MjBkMCBmcy9zcXVhc2hmcy9maWxl
LmM6NTY5Cj4gIHJlYWRfcGFnZXMrMHgxODMvMHg4MzAgbW0vcmVhZGFoZWFkLmM6MTYwCj4gIHBh
Z2VfY2FjaGVfcmFfdW5ib3VuZGVkKzB4NjhlLzB4N2MwIG1tL3JlYWRhaGVhZC5jOjI2OQo+ICBw
YWdlX2NhY2hlX3N5bmNfcmVhZGFoZWFkIGluY2x1ZGUvbGludXgvcGFnZW1hcC5oOjEyNjYgW2lu
bGluZV0KPiAgZmlsZW1hcF9nZXRfcGFnZXMrMHg0OWMvMHgyMDgwIG1tL2ZpbGVtYXAuYzoyNDk3
Cj4gIGZpbGVtYXBfcmVhZCsweDQyYi8weDEwYjAgbW0vZmlsZW1hcC5jOjI1OTMKPiAgX19rZXJu
ZWxfcmVhZCsweDQyNS8weDhiMCBmcy9yZWFkX3dyaXRlLmM6NDI4Cj4gIGludGVncml0eV9rZXJu
ZWxfcmVhZCsweGIwLzB4ZjAgc2VjdXJpdHkvaW50ZWdyaXR5L2lpbnQuYzoyMjEKPiAgaW1hX2Nh
bGNfZmlsZV9oYXNoX3RmbSBzZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9jcnlwdG8uYzo0ODUg
W2lubGluZV0KPiAgaW1hX2NhbGNfZmlsZV9zaGFzaCBzZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2lt
YV9jcnlwdG8uYzo1MTYgW2lubGluZV0KPiAgaW1hX2NhbGNfZmlsZV9oYXNoKzB4YWQxLzB4MWIz
MCBzZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9jcnlwdG8uYzo1NzMKPiAgaW1hX2NvbGxlY3Rf
bWVhc3VyZW1lbnQrMHg1NTQvMHhiMzAgc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9pbWFfYXBpLmM6
MjkwCj4gIHByb2Nlc3NfbWVhc3VyZW1lbnQrMHgxMzczLzB4MjFjMCBzZWN1cml0eS9pbnRlZ3Jp
dHkvaW1hL2ltYV9tYWluLmM6MzU5Cj4gIGltYV9maWxlX2NoZWNrKzB4ZjEvMHgxNzAgc2VjdXJp
dHkvaW50ZWdyaXR5L2ltYS9pbWFfbWFpbi5jOjU1Nwo+ICBkb19vcGVuIGZzL25hbWVpLmM6MzYy
NCBbaW5saW5lXQo+ICBwYXRoX29wZW5hdCsweDI4OTMvMHgzMjgwIGZzL25hbWVpLmM6Mzc3OQo+
ICBkb19maWxwX29wZW4rMHgyMzQvMHg0OTAgZnMvbmFtZWkuYzozODA5Cj4gIGRvX3N5c19vcGVu
YXQyKzB4MTNlLzB4MWQwIGZzL29wZW4uYzoxNDQwCj4gIGRvX3N5c19vcGVuIGZzL29wZW4uYzox
NDU1IFtpbmxpbmVdCj4gIF9fZG9fc3lzX29wZW4gZnMvb3Blbi5jOjE0NjMgW2lubGluZV0KPiAg
X19zZV9zeXNfb3BlbiBmcy9vcGVuLmM6MTQ1OSBbaW5saW5lXQo+ICBfX3g2NF9zeXNfb3Blbisw
eDIyNS8weDI3MCBmcy9vcGVuLmM6MTQ1OQo+ICBkb19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRy
eS9jb21tb24uYzo1MSBbaW5saW5lXQo+ICBkb19zeXNjYWxsXzY0KzB4NDQvMHgxMTAgYXJjaC94
ODYvZW50cnkvY29tbW9uLmM6ODIKPiAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4
NjMvMHg2Ygo+IFJJUDogMDAzMzoweDdmMGU3M2Q2YzVmOQo+IENvZGU6IDI4IDAwIDAwIDAwIDc1
IDA1IDQ4IDgzIGM0IDI4IGMzIGU4IDYxIDE3IDAwIDAwIDkwIDQ4IDg5IGY4IDQ4IDg5IGY3IDQ4
IDg5IGQ2IDQ4IDg5IGNhIDRkIDg5IGMyIDRkIDg5IGM4IDRjIDhiIDRjIDI0IDA4IDBmIDA1IDw0
OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggYzcgYzEgYjggZmYgZmYgZmYgZjcgZDggNjQg
ODkgMDEgNDgKPiBSU1A6IDAwMmI6MDAwMDdmZmQ1MTZmZjE1OCBFRkxBR1M6IDAwMDAwMjQ2IE9S
SUdfUkFYOiAwMDAwMDAwMDAwMDAwMDAyCj4gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAz
MTY1NmM2OTY2MmYyZSBSQ1g6IDAwMDA3ZjBlNzNkNmM1ZjkKPiBSRFg6IDAwMDAwMDAwMDAwMDAw
MDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogMDAwMDAwMDAyMDAwMDBjMAo+IFJCUDogMDAw
MDdmMGU3M2RkZjYxMCBSMDg6IDAwMDAwMDAwMDAwMDAyMjUgUjA5OiAwMDAwMDAwMDAwMDAwMDAw
Cj4gUjEwOiAwMDAwN2ZmZDUxNmZmMDIwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDAw
MDAwMDAwMDAwMDEKPiBSMTM6IDAwMDA3ZmZkNTE2ZmYzMjggUjE0OiAwMDAwMDAwMDAwMDAwMDAx
IFIxNTogMDAwMDAwMDAwMDAwMDAwMQo+ICA8L1RBU0s+Cj4KPiBBbGxvY2F0ZWQgYnkgdGFzayA1
MDY3Ogo+ICBrYXNhbl9zYXZlX3N0YWNrIG1tL2thc2FuL2NvbW1vbi5jOjQ1IFtpbmxpbmVdCj4g
IGthc2FuX3NldF90cmFjaysweDRmLzB4NzAgbW0va2FzYW4vY29tbW9uLmM6NTIKPiAgX19fX2th
c2FuX2ttYWxsb2MgbW0va2FzYW4vY29tbW9uLmM6Mzc0IFtpbmxpbmVdCj4gIF9fa2FzYW5fa21h
bGxvYysweDk4LzB4YjAgbW0va2FzYW4vY29tbW9uLmM6MzgzCj4gIGthc2FuX2ttYWxsb2MgaW5j
bHVkZS9saW51eC9rYXNhbi5oOjE5OCBbaW5saW5lXQo+ICBfX2RvX2ttYWxsb2Nfbm9kZSBtbS9z
bGFiX2NvbW1vbi5jOjEwMDcgW2lubGluZV0KPiAgX19rbWFsbG9jKzB4YjkvMHgyMzAgbW0vc2xh
Yl9jb21tb24uYzoxMDIwCj4gIGttYWxsb2NfYXJyYXkgaW5jbHVkZS9saW51eC9zbGFiLmg6NjM3
IFtpbmxpbmVdCj4gIHNxdWFzaGZzX3JlYWRhaGVhZCsweDMwYy8weDIwZDAgZnMvc3F1YXNoZnMv
ZmlsZS5jOjU1Mgo+ICByZWFkX3BhZ2VzKzB4MTgzLzB4ODMwIG1tL3JlYWRhaGVhZC5jOjE2MAo+
ICBwYWdlX2NhY2hlX3JhX3VuYm91bmRlZCsweDY4ZS8weDdjMCBtbS9yZWFkYWhlYWQuYzoyNjkK
PiAgcGFnZV9jYWNoZV9zeW5jX3JlYWRhaGVhZCBpbmNsdWRlL2xpbnV4L3BhZ2VtYXAuaDoxMjY2
IFtpbmxpbmVdCj4gIGZpbGVtYXBfZ2V0X3BhZ2VzKzB4NDljLzB4MjA4MCBtbS9maWxlbWFwLmM6
MjQ5Nwo+ICBmaWxlbWFwX3JlYWQrMHg0MmIvMHgxMGIwIG1tL2ZpbGVtYXAuYzoyNTkzCj4gIF9f
a2VybmVsX3JlYWQrMHg0MjUvMHg4YjAgZnMvcmVhZF93cml0ZS5jOjQyOAo+ICBpbnRlZ3JpdHlf
a2VybmVsX3JlYWQrMHhiMC8weGYwIHNlY3VyaXR5L2ludGVncml0eS9paW50LmM6MjIxCj4gIGlt
YV9jYWxjX2ZpbGVfaGFzaF90Zm0gc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9pbWFfY3J5cHRvLmM6
NDg1IFtpbmxpbmVdCj4gIGltYV9jYWxjX2ZpbGVfc2hhc2ggc2VjdXJpdHkvaW50ZWdyaXR5L2lt
YS9pbWFfY3J5cHRvLmM6NTE2IFtpbmxpbmVdCj4gIGltYV9jYWxjX2ZpbGVfaGFzaCsweGFkMS8w
eDFiMzAgc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9pbWFfY3J5cHRvLmM6NTczCj4gIGltYV9jb2xs
ZWN0X21lYXN1cmVtZW50KzB4NTU0LzB4YjMwIHNlY3VyaXR5L2ludGVncml0eS9pbWEvaW1hX2Fw
aS5jOjI5MAo+ICBwcm9jZXNzX21lYXN1cmVtZW50KzB4MTM3My8weDIxYzAgc2VjdXJpdHkvaW50
ZWdyaXR5L2ltYS9pbWFfbWFpbi5jOjM1OQo+ICBpbWFfZmlsZV9jaGVjaysweGYxLzB4MTcwIHNl
Y3VyaXR5L2ludGVncml0eS9pbWEvaW1hX21haW4uYzo1NTcKPiAgZG9fb3BlbiBmcy9uYW1laS5j
OjM2MjQgW2lubGluZV0KPiAgcGF0aF9vcGVuYXQrMHgyODkzLzB4MzI4MCBmcy9uYW1laS5jOjM3
NzkKPiAgZG9fZmlscF9vcGVuKzB4MjM0LzB4NDkwIGZzL25hbWVpLmM6MzgwOQo+ICBkb19zeXNf
b3BlbmF0MisweDEzZS8weDFkMCBmcy9vcGVuLmM6MTQ0MAo+ICBkb19zeXNfb3BlbiBmcy9vcGVu
LmM6MTQ1NSBbaW5saW5lXQo+ICBfX2RvX3N5c19vcGVuIGZzL29wZW4uYzoxNDYzIFtpbmxpbmVd
Cj4gIF9fc2Vfc3lzX29wZW4gZnMvb3Blbi5jOjE0NTkgW2lubGluZV0KPiAgX194NjRfc3lzX29w
ZW4rMHgyMjUvMHgyNzAgZnMvb3Blbi5jOjE0NTkKPiAgZG9fc3lzY2FsbF94NjQgYXJjaC94ODYv
ZW50cnkvY29tbW9uLmM6NTEgW2lubGluZV0KPiAgZG9fc3lzY2FsbF82NCsweDQ0LzB4MTEwIGFy
Y2gveDg2L2VudHJ5L2NvbW1vbi5jOjgyCj4gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFt
ZSsweDYzLzB4NmIKPgo+IFRoZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIG9iamVjdCBh
dCBmZmZmODg4MDFlMzkzNjQwCj4gIHdoaWNoIGJlbG9uZ3MgdG8gdGhlIGNhY2hlIGttYWxsb2Mt
OCBvZiBzaXplIDgKPiBUaGUgYnVnZ3kgYWRkcmVzcyBpcyBsb2NhdGVkIDAgYnl0ZXMgdG8gdGhl
IHJpZ2h0IG9mCj4gIGFsbG9jYXRlZCA4LWJ5dGUgcmVnaW9uIFtmZmZmODg4MDFlMzkzNjQwLCBm
ZmZmODg4MDFlMzkzNjQ4KQo+Cj4gVGhlIGJ1Z2d5IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgcGh5
c2ljYWwgcGFnZToKPiBwYWdlOmZmZmZlYTAwMDA3OGU0YzAgcmVmY291bnQ6MSBtYXBjb3VudDow
IG1hcHBpbmc6MDAwMDAwMDAwMDAwMDAwMCBpbmRleDoweGZmZmY4ODgwMWUzOTMyMzAgcGZuOjB4
MWUzOTMKPiBhbm9uIGZsYWdzOiAweGZmZjAwMDAwMDAwODAwKHNsYWJ8bm9kZT0wfHpvbmU9MXxs
YXN0Y3B1cGlkPTB4N2ZmKQo+IHBhZ2VfdHlwZTogMHhmZmZmZmZmZigpCj4gcmF3OiAwMGZmZjAw
MDAwMDAwODAwIGZmZmY4ODgwMTJjNDEyODAgMDAwMDAwMDAwMDAwMDAwMCBkZWFkMDAwMDAwMDAw
MDAxCj4gcmF3OiBmZmZmODg4MDFlMzkzMjMwIDAwMDAwMDAwODA2NjAwNjMgMDAwMDAwMDFmZmZm
ZmZmZiAwMDAwMDAwMDAwMDAwMDAwCj4gcGFnZSBkdW1wZWQgYmVjYXVzZToga2FzYW46IGJhZCBh
Y2Nlc3MgZGV0ZWN0ZWQKPiBwYWdlX293bmVyIHRyYWNrcyB0aGUgcGFnZSBhcyBhbGxvY2F0ZWQK
PiBwYWdlIGxhc3QgYWxsb2NhdGVkIHZpYSBvcmRlciAwLCBtaWdyYXRldHlwZSBVbm1vdmFibGUs
IGdmcF9tYXNrIDB4MTJjYzAoR0ZQX0tFUk5FTHxfX0dGUF9OT1dBUk58X19HRlBfTk9SRVRSWSks
IHBpZCAxLCB0Z2lkIDEgKHN3YXBwZXIvMCksIHRzIDEwNjQ5MjAyNjM1LCBmcmVlX3RzIDkzNTg3
MjcyNzAKPiAgc2V0X3BhZ2Vfb3duZXIgaW5jbHVkZS9saW51eC9wYWdlX293bmVyLmg6MzEgW2lu
bGluZV0KPiAgcG9zdF9hbGxvY19ob29rKzB4MWU2LzB4MjEwIG1tL3BhZ2VfYWxsb2MuYzoxNTM3
Cj4gIHByZXBfbmV3X3BhZ2UgbW0vcGFnZV9hbGxvYy5jOjE1NDQgW2lubGluZV0KPiAgZ2V0X3Bh
Z2VfZnJvbV9mcmVlbGlzdCsweDMzOWEvMHgzNTMwIG1tL3BhZ2VfYWxsb2MuYzozMzEyCj4gIF9f
YWxsb2NfcGFnZXMrMHgyNTUvMHg2NzAgbW0vcGFnZV9hbGxvYy5jOjQ1NjgKPiAgYWxsb2NfcGFn
ZXNfbXBvbCsweDNkZS8weDY0MCBtbS9tZW1wb2xpY3kuYzoyMTMzCj4gIGFsbG9jX3NsYWJfcGFn
ZSsweDZhLzB4MTYwIG1tL3NsdWIuYzoxODcwCj4gIGFsbG9jYXRlX3NsYWIgbW0vc2x1Yi5jOjIw
MTcgW2lubGluZV0KPiAgbmV3X3NsYWIrMHg4NC8weDJmMCBtbS9zbHViLmM6MjA3MAo+ICBfX19z
bGFiX2FsbG9jKzB4Yzg1LzB4MTMxMCBtbS9zbHViLmM6MzIyMwo+ICBfX3NsYWJfYWxsb2MgbW0v
c2x1Yi5jOjMzMjIgW2lubGluZV0KPiAgX19zbGFiX2FsbG9jX25vZGUgbW0vc2x1Yi5jOjMzNzUg
W2lubGluZV0KPiAgc2xhYl9hbGxvY19ub2RlIG1tL3NsdWIuYzozNDY4IFtpbmxpbmVdCj4gIF9f
a21lbV9jYWNoZV9hbGxvY19ub2RlKzB4MjFkLzB4MzAwIG1tL3NsdWIuYzozNTE3Cj4gIF9fZG9f
a21hbGxvY19ub2RlIG1tL3NsYWJfY29tbW9uLmM6MTAwNiBbaW5saW5lXQo+ICBfX2ttYWxsb2Nf
bm9kZV90cmFja19jYWxsZXIrMHhhNS8weDIzMCBtbS9zbGFiX2NvbW1vbi5jOjEwMjcKPiAga3N0
cmR1cCsweDNhLzB4NzAgbW0vdXRpbC5jOjYyCj4gIF9fa2VybmZzX25ld19ub2RlKzB4OWQvMHg4
NzAgZnMva2VybmZzL2Rpci5jOjYxMQo+ICBrZXJuZnNfbmV3X25vZGUrMHg5OS8weDE3MCBmcy9r
ZXJuZnMvZGlyLmM6Njc5Cj4gIGtlcm5mc19jcmVhdGVfbGluaysweGE1LzB4MWYwIGZzL2tlcm5m
cy9zeW1saW5rLmM6MzkKPiAgc3lzZnNfZG9fY3JlYXRlX2xpbmtfc2QrMHg4NS8weDEwMCBmcy9z
eXNmcy9zeW1saW5rLmM6NDQKPiAgZGV2aWNlX2NyZWF0ZV9zeXNfZGV2X2VudHJ5KzB4MTBmLzB4
MTcwIGRyaXZlcnMvYmFzZS9jb3JlLmM6MzQ1MQo+ICBkZXZpY2VfYWRkKzB4OGNmLzB4ZDMwIGRy
aXZlcnMvYmFzZS9jb3JlLmM6MzU5NQo+IHBhZ2UgbGFzdCBmcmVlIHN0YWNrIHRyYWNlOgo+ICBy
ZXNldF9wYWdlX293bmVyIGluY2x1ZGUvbGludXgvcGFnZV9vd25lci5oOjI0IFtpbmxpbmVdCj4g
IGZyZWVfcGFnZXNfcHJlcGFyZSBtbS9wYWdlX2FsbG9jLmM6MTEzNyBbaW5saW5lXQo+ICBmcmVl
X3VucmVmX3BhZ2VfcHJlcGFyZSsweDkyYS8weGE1MCBtbS9wYWdlX2FsbG9jLmM6MjM0Nwo+ICBm
cmVlX3VucmVmX3BhZ2UrMHgzNy8weDNmMCBtbS9wYWdlX2FsbG9jLmM6MjQ4Nwo+ICB2ZnJlZSsw
eDE4Ni8weDJlMCBtbS92bWFsbG9jLmM6Mjg0Mgo+ICBkZWxheWVkX3ZmcmVlX3dvcmsrMHg1Ni8w
eDgwIG1tL3ZtYWxsb2MuYzoyNzYzCj4gIHByb2Nlc3Nfb25lX3dvcmsga2VybmVsL3dvcmtxdWV1
ZS5jOjI2MzAgW2lubGluZV0KPiAgcHJvY2Vzc19zY2hlZHVsZWRfd29ya3MrMHg5MGYvMHgxNDAw
IGtlcm5lbC93b3JrcXVldWUuYzoyNzAzCj4gIHdvcmtlcl90aHJlYWQrMHhhNWYvMHhmZjAga2Vy
bmVsL3dvcmtxdWV1ZS5jOjI3ODQKPiAga3RocmVhZCsweDJkMy8weDM3MCBrZXJuZWwva3RocmVh
ZC5jOjM4OAo+ICByZXRfZnJvbV9mb3JrKzB4NDgvMHg4MCBhcmNoL3g4Ni9rZXJuZWwvcHJvY2Vz
cy5jOjE0Nwo+ICByZXRfZnJvbV9mb3JrX2FzbSsweDExLzB4MjAgYXJjaC94ODYvZW50cnkvZW50
cnlfNjQuUzoyNDIKPgo+IE1lbW9yeSBzdGF0ZSBhcm91bmQgdGhlIGJ1Z2d5IGFkZHJlc3M6Cj4g
IGZmZmY4ODgwMWUzOTM1MDA6IDAwIGZjIGZjIGZjIGZjIGZhIGZjIGZjIGZjIGZjIDA1IGZjIGZj
IGZjIGZjIDA1Cj4gIGZmZmY4ODgwMWUzOTM1ODA6IGZjIGZjIGZjIGZjIDAwIGZjIGZjIGZjIGZj
IDA1IGZjIGZjIGZjIGZjIGZhIGZjCj4gPmZmZmY4ODgwMWUzOTM2MDA6IGZjIGZjIGZjIDAwIGZj
IGZjIGZjIGZjIDAwIGZjIGZjIGZjIGZjIDAwIGZjIGZjCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAgZmZmZjg4ODAxZTM5MzY4MDogZmMgZmMgMDAg
ZmMgZmMgZmMgZmMgMDAgZmMgZmMgZmMgZmMgMDAgZmMgZmMgZmMKPiAgZmZmZjg4ODAxZTM5Mzcw
MDogZmMgMDAgZmMgZmMgZmMgZmMgZmIgZmMgZmMgZmMgZmMgMDAgZmMgZmMgZmMgZmMKPiA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KPgo+Cj4gLS0tCj4gVGhpcyByZXBvcnQgaXMgZ2VuZXJhdGVkIGJ5IGEgYm90LiBJdCBt
YXkgY29udGFpbiBlcnJvcnMuCj4gU2VlIGh0dHBzOi8vZ29vLmdsL3Rwc21FSiBmb3IgbW9yZSBp
bmZvcm1hdGlvbiBhYm91dCBzeXpib3QuCj4gc3l6Ym90IGVuZ2luZWVycyBjYW4gYmUgcmVhY2hl
ZCBhdCBzeXprYWxsZXJAZ29vZ2xlZ3JvdXBzLmNvbS4KPgo+IHN5emJvdCB3aWxsIGtlZXAgdHJh
Y2sgb2YgdGhpcyBpc3N1ZS4gU2VlOgo+IGh0dHBzOi8vZ29vLmdsL3Rwc21FSiNzdGF0dXMgZm9y
IGhvdyB0byBjb21tdW5pY2F0ZSB3aXRoIHN5emJvdC4KPiBGb3IgaW5mb3JtYXRpb24gYWJvdXQg
YmlzZWN0aW9uIHByb2Nlc3Mgc2VlOiBodHRwczovL2dvby5nbC90cHNtRUojYmlzZWN0aW9uCj4K
PiBJZiB0aGUgcmVwb3J0IGlzIGFscmVhZHkgYWRkcmVzc2VkLCBsZXQgc3l6Ym90IGtub3cgYnkg
cmVwbHlpbmcgd2l0aDoKPiAjc3l6IGZpeDogZXhhY3QtY29tbWl0LXRpdGxlCj4KPiBJZiB5b3Ug
d2FudCBzeXpib3QgdG8gcnVuIHRoZSByZXByb2R1Y2VyLCByZXBseSB3aXRoOgo+ICNzeXogdGVz
dDogZ2l0Oi8vcmVwby9hZGRyZXNzLmdpdCBicmFuY2gtb3ItY29tbWl0LWhhc2gKPiBJZiB5b3Ug
YXR0YWNoIG9yIHBhc3RlIGEgZ2l0IHBhdGNoLCBzeXpib3Qgd2lsbCBhcHBseSBpdCBiZWZvcmUg
dGVzdGluZy4KPgo+IElmIHlvdSB3YW50IHRvIG92ZXJ3cml0ZSByZXBvcnQncyBzdWJzeXN0ZW1z
LCByZXBseSB3aXRoOgo+ICNzeXogc2V0IHN1YnN5c3RlbXM6IG5ldy1zdWJzeXN0ZW0KPiAoU2Vl
IHRoZSBsaXN0IG9mIHN1YnN5c3RlbSBuYW1lcyBvbiB0aGUgd2ViIGRhc2hib2FyZCkKPgo+IElm
IHRoZSByZXBvcnQgaXMgYSBkdXBsaWNhdGUgb2YgYW5vdGhlciBvbmUsIHJlcGx5IHdpdGg6Cj4g
I3N5eiBkdXA6IGV4YWN0LXN1YmplY3Qtb2YtYW5vdGhlci1yZXBvcnQKPgo+IElmIHlvdSB3YW50
IHRvIHVuZG8gZGVkdXBsaWNhdGlvbiwgcmVwbHkgd2l0aDoKPiAjc3l6IHVuZHVwCj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpTcXVhc2hmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKU3F1YXNoZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL3NxdWFzaGZzLWRldmVsCg==
