Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E470547193
	for <lists+squashfs-devel@lfdr.de>; Sat, 11 Jun 2022 05:23:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nzriO-00016p-Vz; Sat, 11 Jun 2022 03:23:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1nzriN-00016i-Lh
 for squashfs-devel@lists.sourceforge.net; Sat, 11 Jun 2022 03:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JJqaW036fSE7ahDdvjFne/NbG1L7oTjPNbmy/zkpQHo=; b=mUEhA36HvwQUIbjL9MnOOnmGWl
 +fHJs8NMXkifIKwwU2wWBZWAvrTpFV1GiGpztaEi/Up9xqjfb/KxSdcUUiTDgniMUoDFlO4iNhCQc
 YGhf6jGfxH5sfA/jLhObkIVc3WHAp226sP2B2xuJMG7NhQzckr09ZUi+ohYMR5QQ6tak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JJqaW036fSE7ahDdvjFne/NbG1L7oTjPNbmy/zkpQHo=; b=W
 9u6HeQaPWvfkclhGgZMaFNHaDL0o8kFNwGdpoeNDcTKHCW5Pzq0uth4PqhmjMWmAG39eCZu1i9PP/
 8UOwSEfOg9H69PttkwIothVdxnh/uqNt4CCWvDK3YrM7LBSI2nfV+LSgJu1MlrQzic1tIy1yqxbIx
 wh7zS/5clpLerpsw=;
Received: from p3plsmtp22-06-2.prod.phx3.secureserver.net ([68.178.252.64]
 helo=p3plsmtp22-06.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nzriK-00EiwE-51
 for squashfs-devel@lists.sourceforge.net; Sat, 11 Jun 2022 03:23:06 +0000
Received: from mailex.mailcore.me ([94.136.40.145]) by :WBEOUT: with ESMTP
 id zri8nNkGDZtBxzri9nadEe; Fri, 10 Jun 2022 20:22:53 -0700
X-CMAE-Analysis: v=2.4 cv=Yb54Wydf c=1 sm=1 tr=0 ts=62a40a8d
 a=7e6w4QD8YWtpVJ/7+iiidw==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=JPEYwPQDsx4A:10 a=g6NoVSEHmQBr8nN1tTEA:9
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: zri8nNkGDZtBx
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=localhost.localdomain)
 by smtp02.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1nzri7-0001TR-K0; Sat, 11 Jun 2022 04:22:52 +0100
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Date: Sat, 11 Jun 2022 04:21:31 +0100
Message-Id: <20220611032133.5743-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfPIoz3BRnV1DojZxCpjeMH0Mg8REZOSpg9M4zddt4wudiR2lg4XcFXrm273RZJfxv4RvQ6+6LU3w39k/BzAc2CaQyz+d+xcrz/CwCTK9IXHM4cdepzyN
 AXymrCfodK91dxEwhc9LrAq9kxNMCA7AbPXBt2HPVfUIGqJ5Qo5XjP04T1b7pBWgoletHb/Hix0RAG4CQUgv7maYOSd/+4LwWu7bWuSkmQDXs8fC1plcSqDa
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, This patch-set enables Squashfs to handle missing
 pages when directly decompressing datablocks into the page cache. Previously
 if the full set of pages needed was not available, Squashfs would have to
 fall back to using an intermediate buffer (the older method), which is slower, 
 involving a memcopy, and it introduc [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [68.178.252.64 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nzriK-00EiwE-51
Subject: [Squashfs-devel] [PATCH 0/2] Squashfs: handle missing pages
 decompressing into page cache
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
Cc: Xiongwei.Song@windriver.com, squashfs-devel@lists.sourceforge.net,
 willy@infradead.org, linux-mm@kvack.org, hsinyi@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hi all,

This patch-set enables Squashfs to handle missing pages when directly
decompressing datablocks into the page cache.

Previously if the full set of pages needed was not available, Squashfs
would have to fall back to using an intermediate buffer (the older
method), which is slower, involving a memcopy, and it introduces
contention on a shared buffer.

The first patch extends the "page actor" code to handle missing pages.

The second patch updates Squashfs_readpage_block() to use the new
functionality, and removes the code that falls back to using
an intermediate buffer.

This patch-set is independent of the readahead work, and it is
standalone.  It can be merged on its own.

But the readahead patch for efficiency also needs this patch-set.

Phillip

----------------------------------------------------------------
Phillip Lougher (2):
      Squashfs: extend "page actor" to handle missing pages
      Squashfs: don't use intermediate buffer if pages missing

 fs/squashfs/block.c        | 10 ++++--
 fs/squashfs/decompressor.h |  1 +
 fs/squashfs/file_direct.c  | 90 +++++++++++-----------------------------------
 fs/squashfs/lz4_wrapper.c  |  7 ++--
 fs/squashfs/lzo_wrapper.c  |  7 ++--
 fs/squashfs/page_actor.c   | 67 ++++++++++++++++++++++++++++------
 fs/squashfs/page_actor.h   | 17 +++++++--
 fs/squashfs/xz_wrapper.c   | 11 +++++-
 fs/squashfs/zlib_wrapper.c | 12 ++++++-
 fs/squashfs/zstd_wrapper.c | 12 ++++++-
 10 files changed, 142 insertions(+), 92 deletions(-)


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
