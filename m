Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D59705752
	for <lists+squashfs-devel@lfdr.de>; Tue, 16 May 2023 21:37:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1pz0U9-0003zR-UO;
	Tue, 16 May 2023 19:37:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1pz0U9-0003zL-7A
 for squashfs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 19:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xpixRs61AGgiYi3ECWVFW12SLJFGRU6amYyMTx60KF8=; b=bW1jJrHcJ8TnIjOfufnX++hFb9
 SpJO5GVMhMRkSZvj6Ioc2UfvQVYJJyKJbVLhcZcyT7Vyg3H8McMS7swrNI2LRaaawMRVHSbani3tH
 Lw7DIvxlWacj2b3SMTSE118ZKWf11MOQU1v5DEJfp3Bt9Lcm3zdGkbdVqmay9XWuRpaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xpixRs61AGgiYi3ECWVFW12SLJFGRU6amYyMTx60KF8=; b=kqkGqu1WazmONBmb2IOqmNtPz3
 hnoYg+Mpmnb3TvAJP1lTzu8rSWNaBraqt3nohHH/TyKhuXV2d3jzq0T+vKEJb6Q4dr12b6zl7JUyZ
 S7sOKSMPm5e1DHfqXHrzkXv/YByEno9X8EpCXpepG3AzTExt0UiT0cihgfOV4oAvfJDI=;
Received: from p3plsmtp27-05-2.prod.phx3.secureserver.net ([216.69.139.54]
 helo=p3plwbeout27-05.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz0U8-009zxa-Kt for squashfs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 19:37:25 +0000
Received: from mailex.mailcore.me ([94.136.40.144]) by :WBEOUT: with ESMTP
 id z0BCphaMJyuX0z0BDpv9P6; Tue, 16 May 2023 12:17:51 -0700
X-CMAE-Analysis: v=2.4 cv=KLOfsHJo c=1 sm=1 tr=0 ts=6463d6df
 a=wXHyRMViKMYRd//SnbHIqA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=3-RhneuVAAAA:8
 a=FXvPX3liAAAA:8 a=IfMCuqTOASDaTjgOz58A:9 a=QEXdDO2ut3YA:10
 a=VLVLkjT_5ZicWzSuYqSo:22 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: z0BCphaMJyuX0
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.87])
 by smtp12.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1pz0BC-00069X-P0; Tue, 16 May 2023 20:17:51 +0100
Message-ID: <74ebf1cd-ce00-1aa2-8258-1bd336dc8470@squashfs.org.uk>
Date: Tue, 16 May 2023 20:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230510-squashfs-cache-v3-1-9f56ffd43f03@axis.com>
Content-Language: en-GB
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20230510-squashfs-cache-v3-1-9f56ffd43f03@axis.com>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfJkaasew7UiLBFHMIhZ5MN6GG0F8LvM5YRoKXYHamsrXtU5bgJ8rl3wvbCABYhO5dAf6j4qwYfSMAnLKxA3/KSCk4iuxyhMte4s6CSAyEkES9gACBK5N
 a6hcXm4JuaK4REzXE5YRuM1BfskHXZQbITxP12xnH5mzyGvsrXejwCVJfBbZU3M4xv156esFiGsyk3M57uAzR+8q2EhAMgZZ0LbA7K0sSccdHM+H7vux7jBM
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 16/05/2023 09:22,
 Vincent Whitchurch wrote: > Before commit
 93e72b3c612adcaca1 ("squashfs: migrate from ll_rw_block > usage to BIO"),
 compressed blocks read by squashfs were cached in the > page ca [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.69.139.54 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.7 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pz0U8-009zxa-Kt
Subject: Re: [Squashfs-devel] [PATCH v3] squashfs: cache partial compressed
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

On 16/05/2023 09:22, Vincent Whitchurch wrote:
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
