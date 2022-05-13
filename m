Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DA5274D0
	for <lists+squashfs-devel@lfdr.de>; Sun, 15 May 2022 03:17:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nq2sW-0001I7-Ep; Sun, 15 May 2022 01:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1npNvp-0006mb-2p
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 05:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Mj3ZfxKWNCT4seCLcwyjK149Rmwfp3gR5un6nuaAHY=; b=hWk6UXFKScwqZAmPp+FTxYigJv
 mwDdFd7tJ0zLez2FdS5WHSj9MkhhDN3kVasq6z6HPoqUDkAL0dgUci8rVxpnQ7J7VjHGktPoNA6ow
 13qwBRpixypVmjeNWvnG5tpGtt2zomXCOQTpEbKycSOwK9/mvoKOx9u8ZHVDG0R4O8Ek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Mj3ZfxKWNCT4seCLcwyjK149Rmwfp3gR5un6nuaAHY=; b=NTOWXqm4WXbfWedOQi93GwptCY
 qBEZfI1oTBWRVfO2ai37T3UVmasvCqqqkPTZJ0yUjEHCCY8x4/A3tH9qVTCxrJKEhNXI4WDWzfCw1
 imLvE61HZsM/d6wFFRxTsivyAFrgAshP7/o8dYa7hx3Vyyn7L6pjIUr7QH4xnLI2hYbE=;
Received: from p3plsmtp23-03-2.prod.phx3.secureserver.net ([68.178.252.166]
 helo=p3plwbeout23-03.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npNvl-00AYd6-Fh
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 05:33:39 +0000
Received: from mailex.mailcore.me ([94.136.40.144]) by :WBEOUT: with ESMTP
 id pNvanIB8ED62fpNvbnB8Ei; Thu, 12 May 2022 22:33:27 -0700
X-CMAE-Analysis: v=2.4 cv=ZP0SJV3b c=1 sm=1 tr=0 ts=627deda7
 a=wXHyRMViKMYRd//SnbHIqA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=oZkIemNP1mAA:10
 a=616qSYTPtpUQLMSZPYAA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: pNvanIB8ED62f
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.33])
 by smtp02.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1npNvZ-00025d-D5; Fri, 13 May 2022 06:33:26 +0100
Message-ID: <1f8a8009-1c05-d55c-08bd-89c5916e5240@squashfs.org.uk>
Date: Fri, 13 May 2022 06:33:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Hsin-Yi Wang <hsinyi@chromium.org>
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
 <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
 <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
 <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfGYd5BslSdMiZ2o4zPnLFy3aURtOb3wESo77AXT/TjORGfP86FYQfVyAO4rHR167ih0MKn4UTvccuK6BgG5ZiLIYU/D1ivpluiNSbL7qIXkDhE83SLUa
 IKgFCqgHr55RyBkp+75RihtAf0P7Buv3ynLhzW3PpAqMVLOGsIuapvzcGOqa5LDEYpvZ+o3TA152hnzURr4A28th8AsaoOlT2L4m7Tv5Qy+bDitQH3JGCkKD
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/05/2022 07:23, Hsin-Yi Wang wrote: > > Hi Matthew, >
 Thanks for reviewing the patch previously. Does this version look good >
 to you? If so, I can send it to the list. > > > Thanks for all of your help.
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [68.178.252.166 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1npNvl-00AYd6-Fh
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
 Matthew Wilcox <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 12/05/2022 07:23, Hsin-Yi Wang wrote:

> 
> Hi Matthew,
> Thanks for reviewing the patch previously. Does this version look good
> to you? If so, I can send it to the list.
> 
> 
> Thanks for all of your help.

Hi Hsin-Yi Wang,

Thanks for updating the patch to minimise the pages used when
creating the page actor.

Looking at the new patch, I have a couple of questions which is worth
clarifying to have a fuller understanding of the readahead behaviour.
In otherwords I'm deducing the behaviour of the readahead calls
from context, and I want to make sure they're doing what I think
they're doing.

+	nr_pages = min(readahead_count(ractl), max_pages);

As I understand it, this will always produce nr_pages which will
cover the entirety of the block to be decompressed?  That is if
a block is block_size, it will return the number of pages necessary
to decompress the entire block?  It will never return less than the
necessary pages, i.e. if the block_size was 128K, it will never
return less than 32 pages?

Similarly, if at the end of the file, where the last block may not
be a full block (i.e. less than block_size) it will only return
the pages covered by the tail end block, not a full block.  For
example, if the last block is 16 Kbytes (and block_size is
128 Kbytes), it will return 4 pages and not 32 pages ...

Obviously this behaviour is important for decompression, because
you must always have enough pages to decompress the entire block
into.

You also shouldn't pass in more pages than expected (i.e. if the
block is only expected to decompress to 4 pages, that's what you
pass, rather than the full block size).  This helps to trap
corrupted blocks, where they are prevented to decompress to larger
than expected.

+ nr_pages = __readahead_batch(ractl, pages, max_pages)

My understanding is that this call will fully populate the
pages array with page references without any holes.  That
is none of the pages array entries will be NULL, meaning
there isn't a page for that entry.  In other words, if the
pages array has 32 pages, each of the 32 entries will
reference a page.

This is important for the decompression code, because it
expects each pages array entry to reference a page, which
can be kmapped to an address.  If an entry in the pages
array is NULL, this will break.

If the pages array can have holes (NULL pointers), I have
written an update patch which allows the decompression code
to handle these NULL pointers.

If the pages array can have NULL pointers, I can send you
the patch which will deal with this.

Thanks

Phillip



> 
>>>
>>> It's also noticed that when the crash happened, nr_pages obtained by
>>> readahead_count() is 512.
>>> nr_pages = readahead_count(ractl); // this line
>>>
>>> 2) Normal cases that won't crash:
>>> [   22.651750] Block @ 0xb3bbca6, compressed size 42172, src size 262144
>>> [   22.653580] Block @ 0xb3c6162, compressed size 29815, src size 262144
>>> [   22.656692] Block @ 0xb4a293f, compressed size 17484, src size 131072
>>> [   22.666099] Block @ 0xb593881, compressed size 39742, src size 262144
>>> [   22.668699] Block @ 0xb59d3bf, compressed size 37841, src size 262144
>>> [   22.695739] Block @ 0x13698673, compressed size 65907, src size 131072
>>> [   22.698619] Block @ 0x136a87e6, compressed size 3155, src size 131072
>>> [   22.703400] Block @ 0xb1babe8, compressed size 99391, src size 131072
>>> [   22.706288] Block @ 0x1514abc6, compressed size 4627, src size 131072
>>>
>>> nr_pages are observed to be 32, 64, 256... These won't cause a crash.
>>> Other values (max_pages, bsize, block...) looks normal
>>>
>>> I'm not sure why the crash happened, but I tried to modify the mask
>>> for a bit. After modifying the mask value to below, the crash is gone
>>> (nr_pages are <=256).
>>> Based on my testing on a 300K pack file, there's no performance change.
>>>
>>> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
>>> index 20ec48cf97c5..f6d9b6f88ed9 100644
>>> --- a/fs/squashfs/file.c
>>> +++ b/fs/squashfs/file.c
>>> @@ -499,8 +499,8 @@ static void squashfs_readahead(struct
>>> readahead_control *ractl)
>>>    {
>>>           struct inode *inode = ractl->mapping->host;
>>>           struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
>>> -       size_t mask = (1UL << msblk->block_log) - 1;
>>>           size_t shift = msblk->block_log - PAGE_SHIFT;
>>> +       size_t mask = (1UL << shift) - 1;
>>>
>>>
>>> Any pointers are appreciated. Thanks!
>>



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
