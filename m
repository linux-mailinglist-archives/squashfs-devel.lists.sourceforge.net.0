Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF0531545
	for <lists+squashfs-devel@lfdr.de>; Mon, 23 May 2022 19:30:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1ntBsq-0000z4-N2; Mon, 23 May 2022 17:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nrxDc-0007wi-Rd
 for squashfs-devel@lists.sourceforge.net; Fri, 20 May 2022 07:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fQVqN8yNl0SPRwiwlTk1W0EDXyc3bH8NG0393Ien5DY=; b=Z/N+tfxjbVGyD+xUANrPdIkCCJ
 Mw/I1YBUEbbde+SuKc7gWfuyNrxE5J6Qc33WnoX/Lkv6Z6sIn/IEP1/TyKuSajqRkpMCSArxAJwDx
 ADmCMKpRvY0ScRXD7/Bvm36cg1Bc4HWtg1iQ60wqT2PMULE1UnxZ/gjQ6CpLKksvRro8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fQVqN8yNl0SPRwiwlTk1W0EDXyc3bH8NG0393Ien5DY=; b=EsGJvyCrdut7237VF1K3soSonu
 Gq1q3kQQNyEnXHHdRyuMkDBIThBmQgg4DP28iIF3CG/FqQYXdp5zcG/Q2HP7eLtRELJOk8FkaOECD
 90mJeBIciD6pEdJljIwG2oVqiGVcr4CXq4mZ6S52Bg7qE8+QNiOSeUWV6ETaAtPk7jv4=;
Received: from mail-vs1-f41.google.com ([209.85.217.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nrxDX-00C6M4-3F
 for squashfs-devel@lists.sourceforge.net; Fri, 20 May 2022 07:38:38 +0000
Received: by mail-vs1-f41.google.com with SMTP id a12so5574434vsp.5
 for <squashfs-devel@lists.sourceforge.net>;
 Fri, 20 May 2022 00:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fQVqN8yNl0SPRwiwlTk1W0EDXyc3bH8NG0393Ien5DY=;
 b=UvUoWH6St0jmkZuxkFipT30AfjesIU6zlH7xc8pdDIEKIwXxatZqiIUUzq+7mrrPuo
 GceM+afRrZ1hXZav7T0FaOSnRJoaHXAMPke0xyjsstcvA4pGDuHImfQ1LNR6FGIE/ciF
 PsOM8Z03YjkJDSJ1LQnNds/6UYhxxdTn8V+1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQVqN8yNl0SPRwiwlTk1W0EDXyc3bH8NG0393Ien5DY=;
 b=kGnEYQFaasjFi/lv+J87RRXmbPtA7bbKn4YguHlcxc6m8TWRjFge33cbVW8Mm0I48I
 9skkJ/Bsvjr41ZsImisROQEONIUuRY63fs/aS9lM3ai1pM92sv0mcu8SC4a0+wiDJpmy
 GarGsTj1k4FSP/BQBebj9jA2AhagJ1hfpO/L9Lo6YtXsFyxz6haYMSgVm48BmvzQWcKH
 ElZMiyt59NsZTYg0aoHLtRMzkcTeeIogBf0yBH0xYA0JlPhO4JmBiFSC1OSOKazFDItj
 ciYFuF4UliMSH/RmYOK5SLk6TRdA4we7VLyYtz4DpDj/GjV04RPTGrqz73rmJcTUc65D
 o+5Q==
X-Gm-Message-State: AOAM532Wwvt8AkFGtiwgPjeTrNtIxtofLMsl7hROrjnAHSdvq8VzrLhA
 RuHiKtgAcMcULcHk/Q4hjnPTkU8KIdffbVZBeXCIhw==
X-Google-Smtp-Source: ABdhPJzZ3D31aEC42YUwA+KNuact7U7PvAna8yHIDuoHLTKOJgCbT1hsjQx7dvdcncFNuhGGX5CaWML9VkX7xh9SQrU=
X-Received: by 2002:a05:6102:1008:b0:335:e260:9ff1 with SMTP id
 q8-20020a056102100800b00335e2609ff1mr3597099vsp.32.1653032309031; Fri, 20 May
 2022 00:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220517082650.2005840-1-hsinyi@chromium.org>
 <20220517082650.2005840-4-hsinyi@chromium.org>
 <CAJMQK-hovwXsuVUDD6-eueD05srWVdx1OWZ9vBdp-bT6De25ig@mail.gmail.com>
 <eef04b7d-6778-ef7e-07a8-a2c916d21fdb@squashfs.org.uk>
In-Reply-To: <eef04b7d-6778-ef7e-07a8-a2c916d21fdb@squashfs.org.uk>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 20 May 2022 15:38:03 +0800
Message-ID: <CAJMQK-ig4QiTP-JqyuSLzWLrOCTKh4tb6D45ksqwMk2bvjkNsQ@mail.gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 20,
 2022 at 11:02 AM Phillip Lougher <phillip@squashfs.org.uk>
 wrote: > > On 19/05/2022 09:09, Hsin-Yi Wang wrote: > > On Tue, May 17, 2022
 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org> wr [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrxDX-00C6M4-3F
X-Mailman-Approved-At: Mon, 23 May 2022 17:30:18 +0000
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
Cc: Xiongwei Song <Xiongwei.Song@windriver.com>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Fri, May 20, 2022 at 11:02 AM Phillip Lougher
<phillip@squashfs.org.uk> wrote:
>
> On 19/05/2022 09:09, Hsin-Yi Wang wrote:
> > On Tue, May 17, 2022 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >>
> >> Implement readahead callback for squashfs. It will read datablocks
> >> which cover pages in readahead request. For a few cases it will
> >> not mark page as uptodate, including:
> >> - file end is 0.
> >> - zero filled blocks.
> >> - current batch of pages isn't in the same datablock or not enough in a
> >>    datablock.
> >> Otherwise pages will be marked as uptodate. The unhandled pages will be
> >> updated by readpage later.
> >>
> >> Suggested-by: Matthew Wilcox <willy@infradead.org>
> >> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >> Reported-by: Matthew Wilcox <willy@infradead.org>
> >> Reported-by: Phillip Lougher <phillip@squashfs.org.uk>
> >> Reported-by: Xiongwei Song <sxwjean@gmail.com>
> >> ---
> >> v1->v2: remove unused check on readahead_expand().
> >> v1: https://lore.kernel.org/lkml/20220516105100.1412740-3-hsinyi@chromium.org/
> >> ---
> >
> > Hi Phillip and Matthew,
> >
> > Regarding the performance issue of this patch, I saw a possible
> > performance gain if we only read the first block instead of reading
> > until nr_pages == 0.
> >
> > To be more clear, apply the following diff (Please ignore the skipping
> > of nr_pages check first. This is a demonstration of "only read and
> > update the first block per readahead call"):
> >
> > diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> > index aad6823f0615..c52f7c4a7cfe 100644
> > --- a/fs/squashfs/file.c
> > +++ b/fs/squashfs/file.c
> > @@ -524,10 +524,8 @@ static void squashfs_readahead(struct
> > readahead_control *ractl)
> >          if (!actor)
> >                  goto out;
> >
> > -       for (;;) {
> > +       {
> >                  nr_pages = __readahead_batch(ractl, pages, max_pages);
> > -               if (!nr_pages)
> > -                       break;
> >
> >                  if (readahead_pos(ractl) >= i_size_read(inode) ||
> >                      nr_pages < max_pages)
> >
> >
> > All the performance numbers:
> > 1. original: 39s
> > 2. revert "mm: put readahead pages in cache earlier": 2.8s
> > 3. v2 of this patch: 2.7s
> > 4. v2 of this patch and apply the diff: 1.8s
> >
> > In my testing data, normally it reads and updates 1~2 blocks per
> > readahead call. The change might not make sense since the performance
> > improvement may only happen in certain cases.
> > What do you think? Or is the performance of the current patch
> > considered reasonable?
>
> It entirely depends on where the speed improvement comes from.
>
>  From experience, the speed improvement is probably worthwhile,
> and probably isn't gained at the expense of worse performance
> on other work-loads.
>
> But this is a guestimate, based on the fact timings 2 and 3
> (2.8s v 2.7s) are almost identical.  Which implies the v2
> patch isn't now doing any more work than the previous
> baseline before the "mm: put readahead pages in cache earlier"
> patch (*).
>
> As such the speed improvement must be coming from increased
> parallelism.  Such as moving from serially reading the
> readahead blocks to parallel reading.
>
Thanks for the idea. I checked this by offlining other cores until
only one core exists. Removing loops still results in less time.

But after counting the #traces lines in squashfs_read_data():
If we remove the for loop (timings 4), the logs are less: 2.3K lines,
while v2 (timings 3) has 3.7K (other timings are also around 3.7K), so
removing loop doesn't look right.

I think v2 should be fine considering the slightly to none regression
compared to before.

Hi Matthew, what do you think? Do you have other comments? If not,
should I send a v3 to change Xiongwei Song's email address or can you
help modify it?

Thanks

> But, without looking at any trace output, that is just a
> guestimate.
>
> Phillip
>
> (*) multiply decompressing the same blocks, which
>      is the cause of the performance regression.
> >
> > Thanks.
> >
> > testing env:
> > - arm64 on kernel 5.10
> > - data: ~ 300K pack file contains some android files
> >
> >>   fs/squashfs/file.c | 77 +++++++++++++++++++++++++++++++++++++++++++++-
> >>   1 file changed, 76 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> >> index a8e495d8eb86..e10a55c5b1eb 100644
> >> --- a/fs/squashfs/file.c
> >> +++ b/fs/squashfs/file.c
> >> @@ -39,6 +39,7 @@
> >>   #include "squashfs_fs_sb.h"
> >>   #include "squashfs_fs_i.h"
> >>   #include "squashfs.h"
> >> +#include "page_actor.h"
> >>
> >>   /*
> >>    * Locate cache slot in range [offset, index] for specified inode.  If
> >> @@ -495,7 +496,81 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
> >>          return 0;
> >>   }
> >>
> >> +static void squashfs_readahead(struct readahead_control *ractl)
> >> +{
> >> +       struct inode *inode = ractl->mapping->host;
> >> +       struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
> >> +       size_t mask = (1UL << msblk->block_log) - 1;
> >> +       size_t shift = msblk->block_log - PAGE_SHIFT;
> >> +       loff_t start = readahead_pos(ractl) &~ mask;
> >> +       size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
> >> +       struct squashfs_page_actor *actor;
> >> +       unsigned int nr_pages = 0;
> >> +       struct page **pages;
> >> +       u64 block = 0;
> >> +       int bsize, res, i, index;
> >> +       int file_end = i_size_read(inode) >> msblk->block_log;
> >> +       unsigned int max_pages = 1UL << shift;
> >> +
> >> +       readahead_expand(ractl, start, (len | mask) + 1);
> >> +
> >> +       if (file_end == 0)
> >> +               return;
> >> +
> >> +       pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
> >> +       if (!pages)
> >> +               return;
> >> +
> >> +       actor = squashfs_page_actor_init_special(pages, max_pages, 0);
> >> +       if (!actor)
> >> +               goto out;
> >> +
> >> +       for (;;) {
> >> +               nr_pages = __readahead_batch(ractl, pages, max_pages);
> >> +               if (!nr_pages)
> >> +                       break;
> >> +
> >> +               if (readahead_pos(ractl) >= i_size_read(inode) ||
> >> +                   nr_pages < max_pages)
> >> +                       goto skip_pages;
> >> +
> >> +               index = pages[0]->index >> shift;
> >> +               if ((pages[nr_pages - 1]->index >> shift) != index)
> >> +                       goto skip_pages;
> >> +
> >> +               bsize = read_blocklist(inode, index, &block);
> >> +               if (bsize == 0)
> >> +                       goto skip_pages;
> >> +
> >> +               res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
> >> +                                        actor);
> >> +
> >> +               if (res >= 0)
> >> +                       for (i = 0; i < nr_pages; i++)
> >> +                               SetPageUptodate(pages[i]);
> >> +
> >> +               for (i = 0; i < nr_pages; i++) {
> >> +                       unlock_page(pages[i]);
> >> +                       put_page(pages[i]);
> >> +               }
> >> +       }
> >> +
> >> +       kfree(actor);
> >> +       kfree(pages);
> >> +       return;
> >> +
> >> +skip_pages:
> >> +       for (i = 0; i < nr_pages; i++) {
> >> +               unlock_page(pages[i]);
> >> +               put_page(pages[i]);
> >> +       }
> >> +
> >> +       kfree(actor);
> >> +out:
> >> +       kfree(pages);
> >> +}
> >>
> >>   const struct address_space_operations squashfs_aops = {
> >> -       .read_folio = squashfs_read_folio
> >> +       .read_folio = squashfs_read_folio,
> >> +       .readahead = squashfs_readahead
> >>   };
> >> --
> >> 2.36.0.550.gb090851708-goog
> >>
>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
