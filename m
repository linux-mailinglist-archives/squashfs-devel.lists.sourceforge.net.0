Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 675FC887A9
	for <lists+squashfs-devel@lfdr.de>; Sat, 10 Aug 2019 05:02:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1hwHef-0005Ir-Oj; Sat, 10 Aug 2019 03:02:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yxx0730@gmail.com>) id 1hwHed-0005Ij-SK
 for squashfs-devel@lists.sourceforge.net; Sat, 10 Aug 2019 03:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3tFwz9Y4xFmViTwLZgI521IVRsz/6aaWXg36zH6PjA=; b=f2P2XNHW9qOYhVemma9TY+9m4e
 CxE3FlXuFBWAVOhJma54Eo4WdY1qmiMur3LFoePVodQrZpUpW5FFuH5AQ6vRkpYVrkw8NJvUbgVIU
 5JuvUcy/IZtPZzqfsigPcqTzujP6gJttJq8T2MNhBYpopWwMGP04MzTwnmD24YJIHvXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T3tFwz9Y4xFmViTwLZgI521IVRsz/6aaWXg36zH6PjA=; b=h
 glQCb+LMSBY8jqutukjAhGxBuCDSQ9C6WY6ZGy+fKCcPfIsBio//rRd/UKCM7Pl4uMWd3TfJtlrjB
 vsJ8X4X3bnUaTeRy4l2I8JNYewS2e5wIvKUmcG5QcDYh+MXDMjixK8FWbrbfgE1mxZ4EKO1GykOqk
 Vp4wL3TMBfMTCmcY=;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hwHec-000JXY-2H
 for squashfs-devel@lists.sourceforge.net; Sat, 10 Aug 2019 03:02:51 +0000
Received: by mail-ot1-f41.google.com with SMTP id k18so8019760otr.3
 for <squashfs-devel@lists.sourceforge.net>;
 Fri, 09 Aug 2019 20:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=T3tFwz9Y4xFmViTwLZgI521IVRsz/6aaWXg36zH6PjA=;
 b=KEw+Xwqz2XY4m/97/ujuV3+xDnLUOk6kImqfxW1bSsNyy1IpvVEWUnMfaQ8IymFZvT
 CVbOrXtWfln2mnMYoMMfl5XwOeUDYzoyPM4enyLHx0qxlxiwIv5ybqLldKRfm2yII1pl
 qxAKaY5SVO+uUjj1CzUJ3BKMmNCs0Frpzj8hJclOwf4w3qGrcSKLLhN4OmiwmvpYG0JH
 aDGq0Bje1aq2WG10eUFWml1WyfcNNRyVo6lw8oSPO05dXMUB0ytrydAj1i9n6/Bc5Uc8
 YRbk3tMMQR8qXXIU56Xf38eqGprqeE2YBqoqaSzzkPXQMCvXzOlvJNrKTLLzOtoCEHVC
 yVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=T3tFwz9Y4xFmViTwLZgI521IVRsz/6aaWXg36zH6PjA=;
 b=JpCksUGmZbL8w4Z+FemCTh8AfaP4GRLsphSWd6kT4JkjB5a2oLjxvLK0lkl4lVyPqy
 7yZrFkpZDkwllDvl43bqD5Vy0xeEl1P1CidnI9qm23v7GChRQueeJWa0M44yFcTEqz/v
 PjzS7Z+tQJ8pIBIPF8KcpT0/SRkByeTEooQmPtXw6qvoing2efCZ7pf3RISblVaaEgC+
 kDMnRzjVSb9MS7YZGkXCUDK3vFxHiAa20fesXbbm/oS8UkacLjYOOhgOfoC+TAynHZD0
 dFTR7fqIpSa9MSebXG20o2/6KqYAZPqkejNCRB6s5KzBodo306JrzDwyIfUVxI99Kd2E
 tV2g==
X-Gm-Message-State: APjAAAUl0g2TuOME3vXAgTpCyEbP+zCGGnoGKf/qnK9yK2lORQ5rgbsI
 FJD0iXTti2NKI93LsLzoFZSj2fG7LVSjKMF7kPaC8cklyaY=
X-Google-Smtp-Source: APXvYqyWV7ttGqYN912wQp8Phj+Mn2nYak7795paPCWzlqFkujr/b0ymxsiVarDZSWYD7khnga9EpiJ/mSf6h30JYfA=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr18531442otj.305.1565406164161; 
 Fri, 09 Aug 2019 20:02:44 -0700 (PDT)
MIME-Version: 1.0
From: Yxx Si <yxx0730@gmail.com>
Date: Fri, 9 Aug 2019 23:02:33 -0400
Message-ID: <CAC6TUiLQatWSZjY0d5tW0J8HhvM4x4v46QqG_U9ipc1xO82qXA@mail.gmail.com>
To: squashfs-devel@lists.sourceforge.net
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (yxx0730[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (yxx0730[at]gmail.com)
 0.0 T_KAM_HTML_FONT_INVALID BODY: Test for Invalidly Named or Formatted
 Colors in HTML
 1.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hwHec-000JXY-2H
Subject: [Squashfs-devel] DECOMP_MULTI_PERCPU consumes more memory than
 expected
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
Content-Type: multipart/mixed; boundary="===============6863995636256573863=="
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

--===============6863995636256573863==
Content-Type: multipart/alternative; boundary="00000000000058193e058fba861c"

--00000000000058193e058fba861c
Content-Type: text/plain; charset="UTF-8"

Hi,

When switching from DECOMP_SINGLE to DECOMP_MULTI_PERCPU,  the system seems
to consume more memories than expected.  This is Linux kernel 4.4.x running
on a 8-core x86_64 system.

The mounted squashfs pkg is compressed with xz and the block size is 128k.
Therefore the expected memory increase should be slightly more than 896k
(128k*7), which is allocated for the extra data cache per core.

However in reality, I observed memory increase of more than double the
expected amount. Does anyone have any clue where is the extra memory is
allocated?

--00000000000058193e058fba861c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div><br><=
/div><div><div style=3D"text-align:left;color:rgb(34,34,34);text-transform:=
none;text-indent:0px;letter-spacing:normal;font-family:Helvetica Neue,Helve=
tica,Arial,sans-serif;font-size:16px;font-style:normal;font-variant:normal;=
font-weight:400;text-decoration:none;word-spacing:0px;white-space:normal;ba=
ckground-color:transparent" dir=3D"ltr"><span><span style=3D"color:rgb(34,3=
4,34);font-family:Arial,Helvetica,sans-serif;font-size:13.33px">When switch=
ing from DECOMP_SINGLE to DECOMP_MULTI_PERCPU,=C2=A0 the system seems to co=
nsume more memories than expected.=C2=A0 This is Linux kernel 4.4.x running=
 on=C2=A0<span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helveti=
ca,sans-serif;font-size:13.33px">a 8-core x86_64 system.</span></span></spa=
n></span></div><div style=3D"text-align:left;color:rgb(34,34,34);text-trans=
form:none;text-indent:0px;letter-spacing:normal;font-family:Helvetica Neue,=
Helvetica,Arial,sans-serif;font-size:16px;font-style:normal;font-variant:no=
rmal;font-weight:400;text-decoration:none;word-spacing:0px;white-space:norm=
al;background-color:transparent" dir=3D"ltr"><span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)"><br style=3D"color:rgb(80,0,80)"></span></div><div =
class=3D"gmail-adL" style=3D"text-align:left;color:rgb(34,34,34);text-trans=
form:none;text-indent:0px;letter-spacing:normal;font-family:Helvetica Neue,=
Helvetica,Arial,sans-serif;font-size:16px;font-style:normal;font-variant:no=
rmal;font-weight:400;text-decoration:none;word-spacing:0px;white-space:norm=
al;background-color:transparent"><span class=3D"gmail-im" style=3D"color:rg=
b(80,0,80)"><div style=3D"color:rgb(80,0,80)" dir=3D"ltr"><span style=3D"co=
lor:rgb(80,0,80)"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helv=
etica,sans-serif;font-size:13.33px">The mounted squashfs pkg is compressed =
with xz and the block size is 128k. Therefore the expected memory increase =
should be slightly more than 896k (128k*7), which is allocated for the extr=
a data cache per core.=C2=A0</span></span></div><div style=3D"color:rgb(80,=
0,80)" dir=3D"ltr"><span style=3D"color:rgb(80,0,80)"><span style=3D"color:=
rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:13.33px"><br=
></span></span></div><div style=3D"color:rgb(80,0,80)" dir=3D"ltr"><span st=
yle=3D"color:rgb(80,0,80)"><span style=3D"color:rgb(34,34,34);font-family:A=
rial,Helvetica,sans-serif;font-size:13.33px">However in reality, I observed=
 memory increase of more than double the expected amount. Does anyone have =
any clue where is the extra memory is allocated?=C2=A0</span></span></div><=
/span></div><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br=
></div></div></div></div>

--00000000000058193e058fba861c--


--===============6863995636256573863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6863995636256573863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel

--===============6863995636256573863==--

