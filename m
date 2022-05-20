Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EE752E346
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZm-0007Os-3N; Fri, 20 May 2022 03:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1nrsuK-0006RA-5n
 for squashfs-devel@lists.sourceforge.net; Fri, 20 May 2022 03:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9zqY/AfKjwFNz17djLBDf76kwePPP85i852fxxtN5M=; b=a7LJ3thMhjW2DKpU5pRjkX5bfC
 hiKMqc77oGbvt1emyZxTza389AJZgWbaA3Wit9EHxs4x83Q8p9osy+L0yGePuuu6gt9BGtUGa6NOZ
 5xjVmek8c2rJLSMPuaaBM8Cxf+HADtQtiAWxuQUloypGnv9HzoVdEVjAZpP/Yf/JE2aM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b9zqY/AfKjwFNz17djLBDf76kwePPP85i852fxxtN5M=; b=aMzWqf/e4hYMeTyDnSIP5gs4zA
 tB4zhGzZZJ7QwFlqYC5EE+tFn3b6gjB7GQiC9ohpKCH3ZJxU5FEoJ7RPM6u5zR6iATLhfMWKN617d
 lARLMf++S/FODL/cmpLw2gegrINir8d9/hIGAVK1UmCQcsCAd09FyYA4TDVIMUFIhUU8=;
Received: from p3plsmtp21-05-2.prod.phx3.secureserver.net ([68.178.252.70]
 helo=p3plwbeout21-05.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrsuE-00BVkB-RJ
 for squashfs-devel@lists.sourceforge.net; Fri, 20 May 2022 03:02:26 +0000
Received: from mailex.mailcore.me ([94.136.40.144]) by :WBEOUT: with ESMTP
 id rsu0n0UQ6bqi7rsu1nJex4; Thu, 19 May 2022 20:02:09 -0700
X-CMAE-Analysis: v=2.4 cv=K5TnowaI c=1 sm=1 tr=0 ts=628704b2
 a=wXHyRMViKMYRd//SnbHIqA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=oZkIemNP1mAA:10 a=cm27Pg_UAAAA:8
 a=JfrnYn6hAAAA:8 a=FXvPX3liAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=8s4zpLD2_1IN5pkUfRcA:9 a=QEXdDO2ut3YA:10 a=xmb-EsYY8bH0VWELuYED:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=UObqyxdv-6Yh2QiB9mM_:22 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: rsu0n0UQ6bqi7
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.33])
 by smtp06.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1nrstx-0007M4-UV; Fri, 20 May 2022 04:02:08 +0100
Message-ID: <eef04b7d-6778-ef7e-07a8-a2c916d21fdb@squashfs.org.uk>
Date: Fri, 20 May 2022 04:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Hsin-Yi Wang <hsinyi@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
 Xiongwei Song <Xiongwei.Song@windriver.com>
References: <20220517082650.2005840-1-hsinyi@chromium.org>
 <20220517082650.2005840-4-hsinyi@chromium.org>
 <CAJMQK-hovwXsuVUDD6-eueD05srWVdx1OWZ9vBdp-bT6De25ig@mail.gmail.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <CAJMQK-hovwXsuVUDD6-eueD05srWVdx1OWZ9vBdp-bT6De25ig@mail.gmail.com>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfLVPrp6QuXtMKCbt04VydJdRxkOk1u8KsOV3Eoz21C5X5i7AvK2h8a7ZDUiPLNYI6BHhjqrBKnZSACpwGwzjulk/nrBfdIy1LytdTX9CclKqrWNdNFPe
 CGulBCpW5qhEkjyurXxeNnmYGeS0YtjiaozWEIXMHDk8KkjEFGFW0+HMnigTIDCzKegz3exuUr+bu2YTwnDY/iGqZ15TWw6Nri6c/UdOpq1PNohwM9ndi+XY
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 19/05/2022 09:09, Hsin-Yi Wang wrote: > On Tue, May 17,
 2022 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote: >> >> Implement
 readahead callback for squashfs. It will read datablocks >> which c [...]
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [68.178.252.70 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nrsuE-00BVkB-RJ
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:11 +0000
Subject: Re: [Squashfs-devel] [PATCH v2 3/3] squashfs: implement readahead
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
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 19/05/2022 09:09, Hsin-Yi Wang wrote:
> On Tue, May 17, 2022 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>
>> Implement readahead callback for squashfs. It will read datablocks
>> which cover pages in readahead request. For a few cases it will
>> not mark page as uptodate, including:
>> - file end is 0.
>> - zero filled blocks.
>> - current batch of pages isn't in the same datablock or not enough in a
>>    datablock.
>> Otherwise pages will be marked as uptodate. The unhandled pages will be
>> updated by readpage later.
>>
>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Reported-by: Matthew Wilcox <willy@infradead.org>
>> Reported-by: Phillip Lougher <phillip@squashfs.org.uk>
>> Reported-by: Xiongwei Song <sxwjean@gmail.com>
>> ---
>> v1->v2: remove unused check on readahead_expand().
>> v1: https://lore.kernel.org/lkml/20220516105100.1412740-3-hsinyi@chromium.org/
>> ---
> 
> Hi Phillip and Matthew,
> 
> Regarding the performance issue of this patch, I saw a possible
> performance gain if we only read the first block instead of reading
> until nr_pages == 0.
> 
> To be more clear, apply the following diff (Please ignore the skipping
> of nr_pages check first. This is a demonstration of "only read and
> update the first block per readahead call"):
> 
> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> index aad6823f0615..c52f7c4a7cfe 100644
> --- a/fs/squashfs/file.c
> +++ b/fs/squashfs/file.c
> @@ -524,10 +524,8 @@ static void squashfs_readahead(struct
> readahead_control *ractl)
>          if (!actor)
>                  goto out;
> 
> -       for (;;) {
> +       {
>                  nr_pages = __readahead_batch(ractl, pages, max_pages);
> -               if (!nr_pages)
> -                       break;
> 
>                  if (readahead_pos(ractl) >= i_size_read(inode) ||
>                      nr_pages < max_pages)
> 
> 
> All the performance numbers:
> 1. original: 39s
> 2. revert "mm: put readahead pages in cache earlier": 2.8s
> 3. v2 of this patch: 2.7s
> 4. v2 of this patch and apply the diff: 1.8s
> 
> In my testing data, normally it reads and updates 1~2 blocks per
> readahead call. The change might not make sense since the performance
> improvement may only happen in certain cases.
> What do you think? Or is the performance of the current patch
> considered reasonable?

It entirely depends on where the speed improvement comes from.

 From experience, the speed improvement is probably worthwhile,
and probably isn't gained at the expense of worse performance
on other work-loads.

But this is a guestimate, based on the fact timings 2 and 3
(2.8s v 2.7s) are almost identical.  Which implies the v2
patch isn't now doing any more work than the previous
baseline before the "mm: put readahead pages in cache earlier"
patch (*).

As such the speed improvement must be coming from increased
parallelism.  Such as moving from serially reading the
readahead blocks to parallel reading.

But, without looking at any trace output, that is just a
guestimate.

Phillip

(*) multiply decompressing the same blocks, which
     is the cause of the performance regression.
> 
> Thanks.
> 
> testing env:
> - arm64 on kernel 5.10
> - data: ~ 300K pack file contains some android files
> 
>>   fs/squashfs/file.c | 77 +++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 76 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
>> index a8e495d8eb86..e10a55c5b1eb 100644
>> --- a/fs/squashfs/file.c
>> +++ b/fs/squashfs/file.c
>> @@ -39,6 +39,7 @@
>>   #include "squashfs_fs_sb.h"
>>   #include "squashfs_fs_i.h"
>>   #include "squashfs.h"
>> +#include "page_actor.h"
>>
>>   /*
>>    * Locate cache slot in range [offset, index] for specified inode.  If
>> @@ -495,7 +496,81 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
>>          return 0;
>>   }
>>
>> +static void squashfs_readahead(struct readahead_control *ractl)
>> +{
>> +       struct inode *inode = ractl->mapping->host;
>> +       struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
>> +       size_t mask = (1UL << msblk->block_log) - 1;
>> +       size_t shift = msblk->block_log - PAGE_SHIFT;
>> +       loff_t start = readahead_pos(ractl) &~ mask;
>> +       size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
>> +       struct squashfs_page_actor *actor;
>> +       unsigned int nr_pages = 0;
>> +       struct page **pages;
>> +       u64 block = 0;
>> +       int bsize, res, i, index;
>> +       int file_end = i_size_read(inode) >> msblk->block_log;
>> +       unsigned int max_pages = 1UL << shift;
>> +
>> +       readahead_expand(ractl, start, (len | mask) + 1);
>> +
>> +       if (file_end == 0)
>> +               return;
>> +
>> +       pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
>> +       if (!pages)
>> +               return;
>> +
>> +       actor = squashfs_page_actor_init_special(pages, max_pages, 0);
>> +       if (!actor)
>> +               goto out;
>> +
>> +       for (;;) {
>> +               nr_pages = __readahead_batch(ractl, pages, max_pages);
>> +               if (!nr_pages)
>> +                       break;
>> +
>> +               if (readahead_pos(ractl) >= i_size_read(inode) ||
>> +                   nr_pages < max_pages)
>> +                       goto skip_pages;
>> +
>> +               index = pages[0]->index >> shift;
>> +               if ((pages[nr_pages - 1]->index >> shift) != index)
>> +                       goto skip_pages;
>> +
>> +               bsize = read_blocklist(inode, index, &block);
>> +               if (bsize == 0)
>> +                       goto skip_pages;
>> +
>> +               res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
>> +                                        actor);
>> +
>> +               if (res >= 0)
>> +                       for (i = 0; i < nr_pages; i++)
>> +                               SetPageUptodate(pages[i]);
>> +
>> +               for (i = 0; i < nr_pages; i++) {
>> +                       unlock_page(pages[i]);
>> +                       put_page(pages[i]);
>> +               }
>> +       }
>> +
>> +       kfree(actor);
>> +       kfree(pages);
>> +       return;
>> +
>> +skip_pages:
>> +       for (i = 0; i < nr_pages; i++) {
>> +               unlock_page(pages[i]);
>> +               put_page(pages[i]);
>> +       }
>> +
>> +       kfree(actor);
>> +out:
>> +       kfree(pages);
>> +}
>>
>>   const struct address_space_operations squashfs_aops = {
>> -       .read_folio = squashfs_read_folio
>> +       .read_folio = squashfs_read_folio,
>> +       .readahead = squashfs_readahead
>>   };
>> --
>> 2.36.0.550.gb090851708-goog
>>



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
