Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4314DCFAD
	for <lists+squashfs-devel@lfdr.de>; Thu, 17 Mar 2022 21:54:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nUx8u-0005yK-3b; Thu, 17 Mar 2022 20:54:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1nUx8s-0005yD-3c
 for squashfs-devel@lists.sourceforge.net; Thu, 17 Mar 2022 20:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7MqOyziCNchB5Uot1sxKpoFge5Q/859dEI/zUbsUHuc=; b=FOEFetm2yi2o9XCIzyPB4T8yGk
 x0AmZwlVK2tBwPFJyx/3/2SdyBs7px3XBdhdoqKYuU8McHScbjYHxBUsmG5utEfR+Bd0c4W+Ovccs
 U4KBd/LpmeN+AKeJPcztYyA5CoPggzmm1s9Rz8PEbrsRXfI4ayc3yhgcnpBc+nMghvgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7MqOyziCNchB5Uot1sxKpoFge5Q/859dEI/zUbsUHuc=; b=J
 haMV2275ZIUhUYTW7UhmdeM+q4yrR/1GlgVucXau4EcdPp/Yvk1zAYfijx2/1LvQbgVEP0llYshbA
 rXLsUHuN1aLNLHoxH2sdw2QRga9GrqI4Oo255FZESIIES90VxV897ta8zK4rLfuPLYdaTplyHrJnV
 BzhP4UFC65qDLY3Q=;
Received: from p3plsmtp24-05-2.prod.phx3.secureserver.net ([68.178.252.190]
 helo=p3plwbeout24-05.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nUx8m-002ITM-Ed
 for squashfs-devel@lists.sourceforge.net; Thu, 17 Mar 2022 20:54:40 +0000
Received: from mailex.mailcore.me ([94.136.40.141]) by :WBEOUT: with ESMTP
 id UwpknJxLClC5XUwplnBbtP; Thu, 17 Mar 2022 13:34:57 -0700
X-CMAE-Analysis: v=2.4 cv=Z5spoFdA c=1 sm=1 tr=0 ts=62339b71
 a=bheWAUFm1xGnSTQFbH9Kqg==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=o8Y5sQTvuykA:10 a=FP58Ms26AAAA:8 a=NEAV23lmAAAA:8
 a=ryZrMDmbnnAo0_BphGwA:9
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: UwpknJxLClC5X
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=linux.fritz.box) by smtp12.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1nUwpj-0005dN-QB; Thu, 17 Mar 2022 20:34:56 +0000
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 squashfs-devel@lists.sourceforge.net
Date: Thu, 17 Mar 2022 20:34:46 +0000
Message-Id: <20220317203446.22444-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfEgvYvQSAd+YLSfMjUvh0o7xP+M5J3bbnTLi0a4sMxxJ1ibHLDSzhRTI8I/UnJ0AdITWQf+YERavR6mJa2dLD+FAF9NzPwcdKbk6k+v1aMo3si9sMYW6
 5AgzinpIF2znFw2/AxU/KpL1oD261NBh1e9C6HUC3wCt+9iuSB39WGoEgR1KlrV99/Tu3OyRTRY27LMC+U+fO9uSTA2bFWTFVQ2k5Qp9pSyY95n7ModPF+0T
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, I'm pleased to announce the release of Squashfs tools
 4.5.1. This is a point release which adds Manpages, a fix for CVE-2021-41072, 
 and the usual minor improvements and bug fixes. The release can be downloaded
 either from Sourceforge, or GitHub. 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [68.178.252.190 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nUx8m-002ITM-Ed
Subject: [Squashfs-devel] [ANN] Squashfs-tools 4.5.1 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hi,

I'm pleased to announce the release of Squashfs tools 4.5.1.
This is a point release which adds Manpages, a fix for
CVE-2021-41072, and the usual minor improvements and bug fixes.

The release can be downloaded either from Sourceforge, or GitHub.

https://sourceforge.net/projects/squashfs/files/latest/download

https://github.com/plougher/squashfs-tools/archive/refs/tags/4.5.1.tar.gz

A summary of the changes is below.

Phillip

	1. Major improvements

		1.1 This release adds Manpages for Mksquashfs(1), Unsquashfs(1),
		    Sqfstar(1) and Sqfscat(1).
		1.2 The -help text output from the utilities has been improved
		    and extended as well (but the Manpages are now more
		    comprehensive).
		1.3 CVE-2021-41072 which is a writing outside of destination
		    exploit, has been fixed.

	2. Minor improvements

		2.1 The number of hard-links in the filesystem is now also
		    displayed by Mksquashfs in the output summary.
		2.2 The number of hard-links written by Unsquashfs is now
		    also displayed in the output summary.
		2.3 Unsquashfs will now write to a pre-existing destination
		    directory, rather than aborting.
		2.4 Unsquashfs now allows "." to used as the destination, to
		    extract to the current directory.
		2.5 The Unsquashfs progress bar now tracks empty files and
		    hardlinks, in addition to data blocks.
		2.6 -no-hardlinks option has been implemented for Sqfstar.
		2.7 More sanity checking for "corrupted" filesystems, including
		    checks for multiply linked directories and directory loops.
		2.8 Options that may cause filesystems to be unmountable have
		    been moved into a new "experts" category in the Mksquashfs
		    help text (and Manpage).

	3. Bug fixes

		3.1 Maximum cpiostyle filename limited to PATH_MAX.  This
		    prevents attempts to overflow the stack, or cause system
		    calls to fail with a too long pathname.
		3.2 Don't always use "max open file limit" when calculating
		    length of queues, as a very large file limit can cause
		    Unsquashfs to abort.  Instead use the smaller of max open
		    file limit and cache size.
		3.3 Fix Mksquashfs silently ignoring Pseudo file definitions
		    when appending.
		3.4 Don't abort if no XATTR support has been built in, and
		    there's XATTRs in the filesystem.  This is a regression
		    introduced in 2019 in Version 4.4.
		3.5 Fix duplicate check when the last file block is sparse.



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
