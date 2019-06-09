Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE03AC7F
	for <lists+squashfs-devel@lfdr.de>; Mon, 10 Jun 2019 01:46:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1ha7Vm-0007IT-BL; Sun, 09 Jun 2019 23:46:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <goliath@infraroot.at>)
 id 1ha7Vk-0007I9-AA; Sun, 09 Jun 2019 23:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rEJ4gbwJpDMPU53/+rJLx+/LckqSTLPlICqr/CRiSXY=; b=DV0DcsYJWzo7rmQzFskt8mTg4r
 Siia7cxKYE7tDHm05BKmPWt7nVFewgwhn8HqqzyZR76zoFFjwwYVrquP/AsRAm8L765ZDF5iBSzM2
 e3qkd9pkrrUfB0Rs75LJkXqqjagp4mFbzVhwob482Km8IaRAR1kVBIgH5Wp9Kbatxzis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rEJ4gbwJpDMPU53/+rJLx+/LckqSTLPlICqr/CRiSXY=; b=BdjxxHwdPkH78Tinpwvz7npYLt
 qnXL63QHzuFb6IR9f2OQH4V/L2R9Nc3cIeI0ZYzrozCXn1gReeGs6NhmZPeRc7fBKoKp/+GtbyWKR
 /191WtjnoUQGr1ZSqeFpx0hdUrWSWJl6R1uskcp9eOEazhIMe65++Waia6Tg4r/FCEP0=;
Received: from mail.infraroot.at ([54.37.73.54])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1ha7Vg-004qk2-0m; Sun, 09 Jun 2019 23:46:04 +0000
Received: from [192.168.178.20] (clnet-p04-043.ikbnet.co.at [83.175.81.43])
 by mail.infraroot.at (Postfix) with ESMTPSA id 708F23FC54;
 Mon, 10 Jun 2019 01:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.infraroot.at 708F23FC54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infraroot.at;
 s=default; t=1560123948;
 bh=rEJ4gbwJpDMPU53/+rJLx+/LckqSTLPlICqr/CRiSXY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lm05GinA9bF+gCo8FAGqlbQm9QeB9hoBxqbj8NE8kaSCO0XpqC/n9Gp3YAE8W3aNL
 WaZxo2ICeo3ho+92dRD78D0bUsMHajTeuQkdjjYoVZW5EFVsehp65oOX5DlzdCoi85
 tUHtnab4I3xw3EF6F6FT0V4jIzYtQDVozVlh69HY=
To: Guan Xin <guanx.bac@gmail.com>
References: <c6a517ac-05f3-91ec-8906-ce8651be5095@infraroot.at>
 <CANeMGR5FuT=gCdnk86byGTqz6YGcaC4dvxpC13Ekm0FtdbJWrQ@mail.gmail.com>
From: David Oberhollenzer <goliath@infraroot.at>
Message-ID: <93561cae-46fa-15cf-1dd5-369bec9483be@infraroot.at>
Date: Mon, 10 Jun 2019 01:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CANeMGR5FuT=gCdnk86byGTqz6YGcaC4dvxpC13Ekm0FtdbJWrQ@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ha7Vg-004qk2-0m
Subject: Re: [Squashfs-devel] [ANNOUNCE] squashfs-tools-ng 0.1
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
Cc: squashfs-devel@lists.sourceforge.net,
 squashfs-announce@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Thanks for checking it out!

On 6/9/19 8:58 AM, Guan Xin wrote:
> BTW, "empty directories cannot have xattrs" -- Might actually be implemented.
> Just tried with squash-tools 4.3 with setfattr on empty dir/mksquashfs
> -xattrs/mount
> and getfattr succeeded.

My concern was that a directory needs to have an LDIR inode to have xattrs.
The LDIR inode requires a directory index, which (in theory) cannot be empty
(count is off by 1, so count=0 means 1 entry).

I took a look at the mksquashfs source again and examined a sample file system
with a hex editor. The index count is simply set to 0 but the index is omitted.

The kernel and unsquashfs don't seem to bother since the directory has size 0.

It feels very much like this is working out by chance rather than by design.

Anyway, I went ahead and patched the gensquahfs tool to do the same.

Thanks,

David


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
