Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0BF531544
	for <lists+squashfs-devel@lfdr.de>; Mon, 23 May 2022 19:30:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1ntBsr-0000zS-1s; Mon, 23 May 2022 17:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nt24Q-0007j3-H3
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9UkTAjLMqC/CtrhNDarVLoFGGkUR7Tt19k80EOtxRE8=; b=dp1RTnOJEwuknVzUOaW5QX3Qp4
 43js61Dkii3oD4/f6dQJb53yU0+kRipwUwP2z9x/KbsCRr+2i98X/uDN00mUXOet7X9BtuGBMLlsE
 Q1pR9nZdMfYed6XBuzApoEsdrXq1CI6u/ruLg4e5PdnyPztved10EC/k+hHAT5k09Un4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9UkTAjLMqC/CtrhNDarVLoFGGkUR7Tt19k80EOtxRE8=; b=EguJE4RFtw5VVFZMGtfnvROPYW
 Uj2AD7P4zVPfczEzKNUb0mpmKyjJQY0sgmEn+uzsqb0fuMQ7Mn8EfjDytIlXgSfokeW31PTBn10PS
 3zxPtppFNYA59qMBWLjgJ/UVdAzmhHlg2RAHeM+VT/PbpuWeobOUQ9AN6NlV7KHrJGiM=;
Received: from mail-vs1-f53.google.com ([209.85.217.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nt24M-001xkW-4T
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:01:38 +0000
Received: by mail-vs1-f53.google.com with SMTP id w10so11569685vsa.4
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 23 May 2022 00:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9UkTAjLMqC/CtrhNDarVLoFGGkUR7Tt19k80EOtxRE8=;
 b=aCBkVFsRWNr28CopDM73cM4KAj/85Qvxiq/tyeO6j+KIX3qtRIlj77OOTO1H5iyuBr
 1ujVpwRhiY8hHDUIMvwvWUKLmcx5PFqk086fZw1OFbRs/YfJaCS8FLFHpXVuSZf1vuBi
 Nr2Q2NUjAOCd/29ZtcpurW2Z3vrh8AWQDS5TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9UkTAjLMqC/CtrhNDarVLoFGGkUR7Tt19k80EOtxRE8=;
 b=F3umcAMWwQsQoSPrD2zf/U4A4IPZVB0ZjCqxLmQV4RtabhO4zuEUCsaiV7q8JjumHN
 zM6ba5Jboxam6oHLAUopi5Ob9IlD//8wGfFwjKN+w44ZfEVpGlp80y+wlO2q62GJsb5T
 Yg8bU7KRw9GwudbQp+iAixyNg8yrBjm/RliRNwdEDkNaJ5QFp7q26Zrc2u9rO97Q4c53
 Qx46Wv9cDxtwWtrgLsCSDIx9CdRIJIsqvHgNeMncsOaYoLJrh2ulECMflj99x4ynIzLr
 f3OLWaYORb8jK1krC7mGC3Tl8Og5Ju9mljAhJEPK3A+bI9y8HmTyQ7Sk8WzpguPE0TuS
 srjw==
X-Gm-Message-State: AOAM533TSX0hZGmPdF1hGKG5Dk0ojyYtOce2QcjXQXzM4rk0+NYLBssG
 76C9TEjX0naG5tJO/8lktk/A7SaNpKD3LsAA/UVZfoEB6IQ=
X-Google-Smtp-Source: ABdhPJy9l+YhOoCiDVJ0wj7674V7uWHHjjYFhjHGb8DHefA9ivXx6WBJL+51nXOC0KR40/bGgLA0JGRrTGlzinaxFMI=
X-Received: by 2002:a67:d488:0:b0:337:ad51:776a with SMTP id
 g8-20020a67d488000000b00337ad51776amr1637380vsj.80.1653289284739; Mon, 23 May
 2022 00:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220517082650.2005840-1-hsinyi@chromium.org>
 <20220517082650.2005840-4-hsinyi@chromium.org>
 <CAJMQK-hovwXsuVUDD6-eueD05srWVdx1OWZ9vBdp-bT6De25ig@mail.gmail.com>
 <eef04b7d-6778-ef7e-07a8-a2c916d21fdb@squashfs.org.uk>
 <CAJMQK-ig4QiTP-JqyuSLzWLrOCTKh4tb6D45ksqwMk2bvjkNsQ@mail.gmail.com>
 <8ac07f00-2e9e-ef98-f808-bcf62539d2da@squashfs.org.uk>
In-Reply-To: <8ac07f00-2e9e-ef98-f808-bcf62539d2da@squashfs.org.uk>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 23 May 2022 15:00:58 +0800
Message-ID: <CAJMQK-iBYwb6q6ZQosRdLMfHgpaCpbq39yPOc3WUH+18UcE5ag@mail.gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, May 21,
 2022 at 4:22 AM Phillip Lougher <phillip@squashfs.org.uk>
 wrote: > > On 20/05/2022 08:38, Hsin-Yi Wang wrote: > > On Fri, May 20, 2022
 at 11:02 AM Phillip Lougher > > <phillip@squashfs [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nt24M-001xkW-4T
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

On Sat, May 21, 2022 at 4:22 AM Phillip Lougher <phillip@squashfs.org.uk> wrote:
>
> On 20/05/2022 08:38, Hsin-Yi Wang wrote:
> > On Fri, May 20, 2022 at 11:02 AM Phillip Lougher
> > <phillip@squashfs.org.uk> wrote:
> >>
> >> On 19/05/2022 09:09, Hsin-Yi Wang wrote:
> >>> On Tue, May 17, 2022 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >>>>
> >>>> Implement readahead callback for squashfs. It will read datablocks
> >>>> which cover pages in readahead request. For a few cases it will
> >>>> not mark page as uptodate, including:
> >>>> - file end is 0.
> >>>> - zero filled blocks.
> >>>> - current batch of pages isn't in the same datablock or not enough in a
> >>>>     datablock.
> >>>> Otherwise pages will be marked as uptodate. The unhandled pages will be
> >>>> updated by readpage later.
> >>>>
> >>>> Suggested-by: Matthew Wilcox <willy@infradead.org>
> >>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >>>> Reported-by: Matthew Wilcox <willy@infradead.org>
> >>>> Reported-by: Phillip Lougher <phillip@squashfs.org.uk>
> >>>> Reported-by: Xiongwei Song <sxwjean@gmail.com>
> >>>> ---
> >>>> v1->v2: remove unused check on readahead_expand().
> >>>> v1: https://lore.kernel.org/lkml/20220516105100.1412740-3-hsinyi@chromium.org/
> >>>> ---
> >>>
> >>> Hi Phillip and Matthew,
> >>>
> >>> Regarding the performance issue of this patch, I saw a possible
> >>> performance gain if we only read the first block instead of reading
> >>> until nr_pages == 0.
> >>>
> >>> To be more clear, apply the following diff (Please ignore the skipping
> >>> of nr_pages check first. This is a demonstration of "only read and
> >>> update the first block per readahead call"):
> >>>
> >>> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> >>> index aad6823f0615..c52f7c4a7cfe 100644
> >>> --- a/fs/squashfs/file.c
> >>> +++ b/fs/squashfs/file.c
> >>> @@ -524,10 +524,8 @@ static void squashfs_readahead(struct
> >>> readahead_control *ractl)
> >>>           if (!actor)
> >>>                   goto out;
> >>>
> >>> -       for (;;) {
> >>> +       {
> >>>                   nr_pages = __readahead_batch(ractl, pages, max_pages);
> >>> -               if (!nr_pages)
> >>> -                       break;
> >>>
> >>>                   if (readahead_pos(ractl) >= i_size_read(inode) ||
> >>>                       nr_pages < max_pages)
> >>>
> >>>
> >>> All the performance numbers:
> >>> 1. original: 39s
> >>> 2. revert "mm: put readahead pages in cache earlier": 2.8s
> >>> 3. v2 of this patch: 2.7s
> >>> 4. v2 of this patch and apply the diff: 1.8s
> >>>
> >>> In my testing data, normally it reads and updates 1~2 blocks per
> >>> readahead call. The change might not make sense since the performance
> >>> improvement may only happen in certain cases.
> >>> What do you think? Or is the performance of the current patch
> >>> considered reasonable?
> >>
> >> It entirely depends on where the speed improvement comes from.
> >>
> >>   From experience, the speed improvement is probably worthwhile,
> >> and probably isn't gained at the expense of worse performance
> >> on other work-loads.
> >>
> >> But this is a guestimate, based on the fact timings 2 and 3
> >> (2.8s v 2.7s) are almost identical.  Which implies the v2
> >> patch isn't now doing any more work than the previous
> >> baseline before the "mm: put readahead pages in cache earlier"
> >> patch (*).
> >>
> >> As such the speed improvement must be coming from increased
> >> parallelism.  Such as moving from serially reading the
> >> readahead blocks to parallel reading.
> >>
> > Thanks for the idea. I checked this by offlining other cores until
> > only one core exists. Removing loops still results in less time.
> >
> > But after counting the #traces lines in squashfs_read_data():
> > If we remove the for loop (timings 4), the logs are less: 2.3K lines,
> > while v2 (timings 3) has 3.7K (other timings are also around 3.7K), so
> > removing loop doesn't look right.
>
> If a lot less data is being read than the other timings, then this does
> look incorrect.
>
> >
> > I think v2 should be fine considering the slightly to none regression
> > compared to before.
> >
>
> The fact the timings are almost identical implies all that needs
> to be done to remove the performance regression has been done.
>
> There are two things missing from the patch which need to
> be handled.  These are not related to performance but error
> handling and correctness.  So I have waited until now to
> raise it.
>
> If you look at the code for file_direct.c::squashfs_readpage_block()
>
> https://elixir.bootlin.com/linux/latest/source/fs/squashfs/file_direct.c#L93
>
> ****
>         res = squashfs_read_data(inode->i_sb, block, bsize, NULL, actor);
>         if (res < 0)
>                 goto mark_errored;
>
>         if (res != expected) {
>                 res = -EIO;
>                 goto mark_errored;
>         }
> ****
>
> You will see that it checks for two return conditions from
> squashfs_read_data().
>
> If the decompressor returns error, or if the decompressed block
> is different in size to that expected, then this is an error situation
> (e.g. corrupted filesystem), and the read is marked as bad.
>
> The current V2 patch doesn't check that the block decompressed
> to the correct size (res != expected), and this could mean
> filesystem corruption is not detected, which will be an
> error handling regression.
>
Thanks for the review. In v3:

Added the check to see if the returned size is expected too. Since we
didn't mark error pages here (in readahead), if the size wasn't
expected, we just don't mark the page as Uptodate.

> Secondly, if you look at
> https://elixir.bootlin.com/linux/latest/source/fs/squashfs/file_direct.c#L102
>
> ****
>         /* Last page may have trailing bytes not filled */
>         bytes = res % PAGE_SIZE;
>         if (bytes) {
>                 pageaddr = kmap_atomic(page[pages - 1]);
>                 memset(pageaddr + bytes, 0, PAGE_SIZE - bytes);
>                 kunmap_atomic(pageaddr);
>         }
> ****
>
> The V2 patch is always reading max_pages, but at the
> end of a file the last page may not be a full page.  This
> is because the last block may not be complete (i.e. it is
> only 126 Kbytes rather than the block_size of 128 Kbytes).
>
> This will leave part of the last page unfilled by the decompressor,
> and it should be zero filled, to avoid leaking data to user-space.

If the size was expected, further check if it's not a full page. If
so, fill it with zeros at the end.

Performance is the same as v2.


>
> Phillip
>
>
> > Hi Matthew, what do you think? Do you have other comments? If not,
> > should I send a v3 to change Xiongwei Song's email address or can you
> > help modify it?
> >
> > Thanks
> >
> >> But, without looking at any trace output, that is just a
> >> guestimate.
> >>
> >> Phillip
> >>
> >> (*) multiply decompressing the same blocks, which
> >>       is the cause of the performance regression.
> >>>
> >>> Thanks.
> >>>
> >>> testing env:
> >>> - arm64 on kernel 5.10
> >>> - data: ~ 300K pack file contains some android files
> >>>
> >>>>    fs/squashfs/file.c | 77 +++++++++++++++++++++++++++++++++++++++++++++-
> >>>>    1 file changed, 76 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> >>>> index a8e495d8eb86..e10a55c5b1eb 100644
> >>>> --- a/fs/squashfs/file.c
> >>>> +++ b/fs/squashfs/file.c
> >>>> @@ -39,6 +39,7 @@
> >>>>    #include "squashfs_fs_sb.h"
> >>>>    #include "squashfs_fs_i.h"
> >>>>    #include "squashfs.h"
> >>>> +#include "page_actor.h"
> >>>>
> >>>>    /*
> >>>>     * Locate cache slot in range [offset, index] for specified inode.  If
> >>>> @@ -495,7 +496,81 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
> >>>>           return 0;
> >>>>    }
> >>>>
> >>>> +static void squashfs_readahead(struct readahead_control *ractl)
> >>>> +{
> >>>> +       struct inode *inode = ractl->mapping->host;
> >>>> +       struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
> >>>> +       size_t mask = (1UL << msblk->block_log) - 1;
> >>>> +       size_t shift = msblk->block_log - PAGE_SHIFT;
> >>>> +       loff_t start = readahead_pos(ractl) &~ mask;
> >>>> +       size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
> >>>> +       struct squashfs_page_actor *actor;
> >>>> +       unsigned int nr_pages = 0;
> >>>> +       struct page **pages;
> >>>> +       u64 block = 0;
> >>>> +       int bsize, res, i, index;
> >>>> +       int file_end = i_size_read(inode) >> msblk->block_log;
> >>>> +       unsigned int max_pages = 1UL << shift;
> >>>> +
> >>>> +       readahead_expand(ractl, start, (len | mask) + 1);
> >>>> +
> >>>> +       if (file_end == 0)
> >>>> +               return;
> >>>> +
> >>>> +       pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
> >>>> +       if (!pages)
> >>>> +               return;
> >>>> +
> >>>> +       actor = squashfs_page_actor_init_special(pages, max_pages, 0);
> >>>> +       if (!actor)
> >>>> +               goto out;
> >>>> +
> >>>> +       for (;;) {
> >>>> +               nr_pages = __readahead_batch(ractl, pages, max_pages);
> >>>> +               if (!nr_pages)
> >>>> +                       break;
> >>>> +
> >>>> +               if (readahead_pos(ractl) >= i_size_read(inode) ||
> >>>> +                   nr_pages < max_pages)
> >>>> +                       goto skip_pages;
> >>>> +
> >>>> +               index = pages[0]->index >> shift;
> >>>> +               if ((pages[nr_pages - 1]->index >> shift) != index)
> >>>> +                       goto skip_pages;
> >>>> +
> >>>> +               bsize = read_blocklist(inode, index, &block);
> >>>> +               if (bsize == 0)
> >>>> +                       goto skip_pages;
> >>>> +
> >>>> +               res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
> >>>> +                                        actor);
> >>>> +
> >>>> +               if (res >= 0)
> >>>> +                       for (i = 0; i < nr_pages; i++)
> >>>> +                               SetPageUptodate(pages[i]);
> >>>> +
> >>>> +               for (i = 0; i < nr_pages; i++) {
> >>>> +                       unlock_page(pages[i]);
> >>>> +                       put_page(pages[i]);
> >>>> +               }
> >>>> +       }
> >>>> +
> >>>> +       kfree(actor);
> >>>> +       kfree(pages);
> >>>> +       return;
> >>>> +
> >>>> +skip_pages:
> >>>> +       for (i = 0; i < nr_pages; i++) {
> >>>> +               unlock_page(pages[i]);
> >>>> +               put_page(pages[i]);
> >>>> +       }
> >>>> +
> >>>> +       kfree(actor);
> >>>> +out:
> >>>> +       kfree(pages);
> >>>> +}
> >>>>
> >>>>    const struct address_space_operations squashfs_aops = {
> >>>> -       .read_folio = squashfs_read_folio
> >>>> +       .read_folio = squashfs_read_folio,
> >>>> +       .readahead = squashfs_readahead
> >>>>    };
> >>>> --
> >>>> 2.36.0.550.gb090851708-goog
> >>>>
> >>
>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
