Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DC0706FE8
	for <lists+squashfs-devel@lfdr.de>; Wed, 17 May 2023 19:49:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1pzLGt-0007rQ-Mm;
	Wed, 17 May 2023 17:49:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1pzLGs-0007rK-Hg
 for squashfs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 17:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LlFXql73eFhVlugKc9xjA7s2l69UN3pQ9jmkcVJ2SHE=; b=iiPIunM5Gztsx+k2sDg2vpET9m
 3fsgH574H+PJsIJRHjj1qlJuWYzpmPoAOHW+wqfUZMw541R3D0xVUpCKs14v2NgOf687QvGzpm24m
 SCnW8duUCQWV5Wq3ZbSpX0rZNErxNFE/EHCCl7pY+U3D3eKCs3xVB0XCfvg9rllKr4b4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LlFXql73eFhVlugKc9xjA7s2l69UN3pQ9jmkcVJ2SHE=; b=iETnRjAqdHG0tIc3d1yDDwXvx7
 +Nb78GyPucbIPYeZth8CwlsBtUX2a6Xa3Opcf49Qz+OUDJ8AO+heimjPwcrx4jlUGINRlt2Wvvan0
 hvA8EwsOWdeh/KaeO2/xeyaXN1Lin3cMbhw/XN24UBfmG+A50EOgDzsLzMvGApRAkgyM=;
Received: from p3plsmtp17-02-2.prod.phx3.secureserver.net ([173.201.193.164]
 helo=p3plwbeout17-02.prod.phx3.secureserver.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzLGs-0002u1-DO for squashfs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 17:49:07 +0000
Received: from mailex.mailcore.me ([94.136.40.144]) by :WBEOUT: with ESMTP
 id zLGmpgBcza71pzLGmpUasQ; Wed, 17 May 2023 10:49:01 -0700
X-CMAE-Analysis: v=2.4 cv=R+vGpfdX c=1 sm=1 tr=0 ts=6465138d
 a=wXHyRMViKMYRd//SnbHIqA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=3-RhneuVAAAA:8
 a=FXvPX3liAAAA:8 a=IfMCuqTOASDaTjgOz58A:9 a=QEXdDO2ut3YA:10
 a=VLVLkjT_5ZicWzSuYqSo:22 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: zLGmpgBcza71p
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.87])
 by smtp11.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1pzLGl-00032a-NG; Wed, 17 May 2023 18:49:00 +0100
Message-ID: <5a2af52b-f8cc-7118-2d08-44bcba1b8fd4@squashfs.org.uk>
Date: Wed, 17 May 2023 18:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230510-squashfs-cache-v4-1-3bd394e1ee71@axis.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20230510-squashfs-cache-v4-1-3bd394e1ee71@axis.com>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfEexfILtLEbac0lvrALvaa6qTIf2w/BmzYkgzUQ0XbJqtY/UYAx9GQIYetwMwXu1quIqerLfiVapfBVZJ9D6rZljD0JXGBe924wDhB5BYkJKtzL3QdcY
 i15mYc2+AbvzNkjdMMKcNiYUzzg593iyhMwUI6usF6S/MhcOKvT3c6AnXZJPxfxWane6cKdwIntoTk3cr0amx/riBnLOn+2Kj1EGovEUr5I6iX0WUi6H4yvo
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 17/05/2023 15:18,
 Vincent Whitchurch wrote: > Before commit
 93e72b3c612adcaca1 ("squashfs: migrate from ll_rw_block > usage to BIO"),
 compressed blocks read by squashfs were cached in the > page ca [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [173.201.193.164 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [173.201.193.164 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pzLGs-0002u1-DO
Subject: Re: [Squashfs-devel] [PATCH v4] squashfs: cache partial compressed
 blocks
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
Cc: squashfs-devel@lists.sourceforge.net, kernel@axis.com, hch@lst.de,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 17/05/2023 15:18, Vincent Whitchurch wrote:
> Before commit 93e72b3c612adcaca1 ("squashfs: migrate from ll_rw_block
> usage to BIO"), compressed blocks read by squashfs were cached in the
> page cache, but that is not the case after that commit.  That has lead
> to squashfs having to re-read a lot of sectors from disk/flash.
>
> For example, the first sectors of every metadata block need to be read
> twice from the disk.  Once partially to read the length, and a
> second time to read the block itself.  Also, in linear reads of large
> files, the last sectors of one data block are re-read from disk when
> reading the next data block, since the compressed blocks are of variable
> sizes and not aligned to device blocks.  This extra I/O results in a
> degrade in read performance of, for example, ~16% in one scenario on my
> ARM platform using squashfs with dm-verity and NAND.
>
> Since the decompressed data is cached in the page cache or squashfs'
> internal metadata and fragment caches, caching _all_ compressed pages
> would lead to a lot of double caching and is undesirable.  But make the
> code cache any disk blocks which were only partially requested, since
> these are the ones likely to include data which is needed by other file
> system blocks.  This restores read performance in my test scenario.
>
> The compressed block caching is only applied when the disk block size is
> equal to the page size, to avoid having to deal with caching sub-page
> reads.
>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>




_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
