Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD955274CC
	for <lists+squashfs-devel@lfdr.de>; Sun, 15 May 2022 03:17:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nq2sW-0001Ih-Ry; Sun, 15 May 2022 01:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1nq24Q-000305-Qd
 for squashfs-devel@lists.sourceforge.net; Sun, 15 May 2022 00:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ceAErmmJO8u2Nu4XzKLLmkKidXWhNtf5IfTpJjq0ODo=; b=Wa8WapyoU1RZ+STM9EY+XJRyxH
 JXwhgvBee2JC81IT7IsK1Icdk6pouaBCg8bCxqcdV8CrGCO3L0EfiFPVnAU2Nf7zgFtXVjnv1b42q
 WprxXZZBveNtwrVONB1MjdAdUVYr9m5doUPtCHGarzGtPcOT/MMwkrfldm1aItR0FClE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ceAErmmJO8u2Nu4XzKLLmkKidXWhNtf5IfTpJjq0ODo=; b=ksXhQAvw1dg5LKDbZsOrS/MM8B
 DdEHpTZuKXH0ZjibG9UukhHVsf8cOVuScpIULCAH0MBai4Q9Y6gsZGAAUaOxPWo2c80Bd0MhfWH1S
 EMBSrFDBH0Fo3Z8Shstv9uxBLjMlWz6uRpMi86kaBhis5r8n/thcUZcMEr9ZHA5/DlhM=;
Received: from p3plsmtp27-01-2.prod.phx3.secureserver.net ([216.69.139.46]
 helo=p3plwbeout27-01.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nq24N-00DH2L-66
 for squashfs-devel@lists.sourceforge.net; Sun, 15 May 2022 00:25:13 +0000
Received: from mailex.mailcore.me ([94.136.40.142]) by :WBEOUT: with ESMTP
 id q1lMnjf1KkMRvq1lMnm3lw; Sat, 14 May 2022 17:05:33 -0700
X-CMAE-Analysis: v=2.4 cv=Ks6IZUaN c=1 sm=1 tr=0 ts=628043cd
 a=s1hRAmXuQnGNrIj+3lWWVA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=oZkIemNP1mAA:10
 a=fLXdSNe98ZZkRG-PP7kA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: q1lMnjf1KkMRv
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.33])
 by smtp10.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1nq1lL-000809-Dx; Sun, 15 May 2022 01:05:31 +0100
Message-ID: <41f94eab-2231-def6-f269-b35c0977fced@squashfs.org.uk>
Date: Sun, 15 May 2022 01:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Matthew Wilcox <willy@infradead.org>
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
 <Yn5Yij9pRPCzDozt@casper.infradead.org>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <Yn5Yij9pRPCzDozt@casper.infradead.org>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfI/TnpK17UXdYjONb8hcHYnDeunA4PG/0Bzhuu2V//yvHfXtOrM2VzduQe2Xlld+ICsgtFq5M3G8riZptB+e0gU2J1sNzFbr0JaYKG5HV+6lfMpjRTVO
 Ksi3GEIsLXQpVOYUcmMGd7IohakW9KThG+7fJN4Z+7V5RLT2mX9/65ZPGqZBymSCfFeK+ELm1pCngkpol/cAfLeOdWWSuCCALVmfhI+1lvA3dxYl4uHOtLAO
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 13/05/2022 14:09, Matthew Wilcox wrote: > On Fri, May 13, 
 2022 at 06:33:21AM +0100, Phillip Lougher wrote: >> Looking at the new patch, 
 I have a couple of questions which is worth >> clarifying to [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.69.139.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.8 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nq24N-00DH2L-66
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 13/05/2022 14:09, Matthew Wilcox wrote:
> On Fri, May 13, 2022 at 06:33:21AM +0100, Phillip Lougher wrote:
>> Looking at the new patch, I have a couple of questions which is worth
>> clarifying to have a fuller understanding of the readahead behaviour.
>> In otherwords I'm deducing the behaviour of the readahead calls
>> from context, and I want to make sure they're doing what I think
>> they're doing.
> 
> I did write quite a lot of documentation as part of the readahead
> revision, and filesystem authors are the target audience, so this is
> somewhat disheartening to read.  What could I have done better to make
> the readahead documentation obvious for you to find?

That wasn't a criticism about your documentation or how hard
it is to find.  Please don't take it that way. It was just
quicker (for me) to understand the patch from a Squashfs
point of view.

Phillip

> 
>> +	nr_pages = min(readahead_count(ractl), max_pages);
>>
>> As I understand it, this will always produce nr_pages which will
>> cover the entirety of the block to be decompressed?  That is if
>> a block is block_size, it will return the number of pages necessary
>> to decompress the entire block?  It will never return less than the
>> necessary pages, i.e. if the block_size was 128K, it will never
>> return less than 32 pages?
> 
> readahead_count() returns the number of pages that the page cache is
> asking the filesystem for.  It may be any number from 1 to whatever
> the current readahead window is.  It's possible to ask the page
> cache to expand the readahead request to be aligned to a decompression
> boundary, but that may not be possible.  For example, we may be in a
> situation where we read pages 32-63 from the file previously, then
> the page cache chose to discard pages 33, 35, 37, .., 63 under memory
> pressure, and now the file is being re-read.  This isn't a likely
> usage pattern, of course, but it's a situation we have to cope with.
> 
>> + nr_pages = __readahead_batch(ractl, pages, max_pages)
>>
>> My understanding is that this call will fully populate the
>> pages array with page references without any holes.  That
>> is none of the pages array entries will be NULL, meaning
>> there isn't a page for that entry.  In other words, if the
>> pages array has 32 pages, each of the 32 entries will
>> reference a page.
> 
> That is correct, a readahead request is always for a contiguous range of
> the file.  The pages are allocated before calling ->readahead, so
> there's no opportunity for failure; they exist and they're already in
> the page cache, waiting for the FS to tell the pagecache that they're
> uptodate and unlock them.
> 



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
