Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3D5274D1
	for <lists+squashfs-devel@lfdr.de>; Sun, 15 May 2022 03:17:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nq2sW-0001IN-MR; Sun, 15 May 2022 01:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1npV3X-0003i4-Iu
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 13:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vjkmmhn9V1xJS8Y88P51tDN7F9AxfolLouhb5JjMtWY=; b=dOzHe+KPrSXBA0HfiC4fUUZinF
 o+3rTw29gL9Axz/vE4CQmieCkRV80NCDQmyO/AMA4r7PG2SIqX8ej/aUkiLp61Whc8Kse4sHIFWPb
 pncJCjBwZ6CC9SY6udjadeeQO66Gs3JcQNKMKVQ2aNfRlVjTMZeuTWIgRzCgkZWKdpWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vjkmmhn9V1xJS8Y88P51tDN7F9AxfolLouhb5JjMtWY=; b=HRlkeS32k57R3xSCRgVu5IHb0Z
 yXPIKz20VSk8ETcMTylBnce10bYaz2Jkws+BQ+WWiv/zIJ3dIAWv6DJs0QJ6rCTvducB6UkrySBeF
 aO+r4F2uhXLyU4DyPzDv3wiRclJXtK0eDuy/Cv4a26iSxIkht4wUG/uL0pwv5YoGnxdU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npV3U-0001JW-01
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 13:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Vjkmmhn9V1xJS8Y88P51tDN7F9AxfolLouhb5JjMtWY=; b=vYk77Cm/4AP4+uHJrQ/ed7zFgp
 BVHbSEi+PeRFDQrix4nlSR5yj97kyHGSyHx+O9iiRBUpfgNJQlqUpNvV7yfYrHxvgVBfS/auhLrea
 zQLqZM2wnDB1+rJlipLyVQ2ksyaYNaDtRfo/WtHAJJ/pEvCL3KjXHqezrrJtH8YcsUU2ww3+gV8Zf
 FSjJMvyWDmME58Ai5HlpguPEMAe28CwGOC+bdltsDWYGCZdh7PXIWNm8yDPVHYxaqOCvZH5W/W2pK
 R+qS8EF0EM+XxXzvb2R8ILtUOcblMHm62+Qas+YHmPlkeHGi8G1gw2H+TwcHNPAxSU3lnaGtnF/Dr
 kIvfZdbg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1npV2w-007Maw-Sq; Fri, 13 May 2022 13:09:31 +0000
Date: Fri, 13 May 2022 14:09:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Phillip Lougher <phillip@squashfs.org.uk>
Message-ID: <Yn5Yij9pRPCzDozt@casper.infradead.org>
References: <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
 <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
 <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
 <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
 <1f8a8009-1c05-d55c-08bd-89c5916e5240@squashfs.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f8a8009-1c05-d55c-08bd-89c5916e5240@squashfs.org.uk>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 13, 2022 at 06:33:21AM +0100, Phillip Lougher
 wrote: > Looking at the new patch, I have a couple of questions which is worth
 > clarifying to have a fuller understanding of the readahead be [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1npV3U-0001JW-01
X-Mailman-Approved-At: Sun, 15 May 2022 01:16:57 +0000
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
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Fri, May 13, 2022 at 06:33:21AM +0100, Phillip Lougher wrote:
> Looking at the new patch, I have a couple of questions which is worth
> clarifying to have a fuller understanding of the readahead behaviour.
> In otherwords I'm deducing the behaviour of the readahead calls
> from context, and I want to make sure they're doing what I think
> they're doing.

I did write quite a lot of documentation as part of the readahead
revision, and filesystem authors are the target audience, so this is
somewhat disheartening to read.  What could I have done better to make
the readahead documentation obvious for you to find?

> +	nr_pages = min(readahead_count(ractl), max_pages);
> 
> As I understand it, this will always produce nr_pages which will
> cover the entirety of the block to be decompressed?  That is if
> a block is block_size, it will return the number of pages necessary
> to decompress the entire block?  It will never return less than the
> necessary pages, i.e. if the block_size was 128K, it will never
> return less than 32 pages?

readahead_count() returns the number of pages that the page cache is
asking the filesystem for.  It may be any number from 1 to whatever
the current readahead window is.  It's possible to ask the page
cache to expand the readahead request to be aligned to a decompression
boundary, but that may not be possible.  For example, we may be in a
situation where we read pages 32-63 from the file previously, then
the page cache chose to discard pages 33, 35, 37, .., 63 under memory
pressure, and now the file is being re-read.  This isn't a likely
usage pattern, of course, but it's a situation we have to cope with.

> + nr_pages = __readahead_batch(ractl, pages, max_pages)
> 
> My understanding is that this call will fully populate the
> pages array with page references without any holes.  That
> is none of the pages array entries will be NULL, meaning
> there isn't a page for that entry.  In other words, if the
> pages array has 32 pages, each of the 32 entries will
> reference a page.

That is correct, a readahead request is always for a contiguous range of
the file.  The pages are allocated before calling ->readahead, so
there's no opportunity for failure; they exist and they're already in
the page cache, waiting for the FS to tell the pagecache that they're
uptodate and unlock them.



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
