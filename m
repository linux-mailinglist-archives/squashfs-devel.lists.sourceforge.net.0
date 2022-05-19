Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB952E34B
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZl-0007Oi-Vv; Fri, 20 May 2022 03:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nrbEO-00080X-5M
 for squashfs-devel@lists.sourceforge.net; Thu, 19 May 2022 08:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6CHqFUc2pzrLwDPfZGytZQ03T9cBPjhPzdLcOw4RoFA=; b=K88cpE6uxeLP6WqnInJgaZEhLk
 lki+KzkoNf/ClmKDP6TRkuzlk5k+q8H4Tj28hq5Em5pXo3xJucXHU15dm+Ae0RPFeTB5W2M0cGoAa
 XkfQj7u4f1UdnMwxnUsnG4dI1pBF8BVWw/BMq6ybQio7cMdqeBIBg6b7AqN8e0G++ZxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6CHqFUc2pzrLwDPfZGytZQ03T9cBPjhPzdLcOw4RoFA=; b=AwHWDJrMxAdmQHXMfh8tFeOjcC
 5usH/Gjkzo1LCH6HspJTYH61xyS8Ymd46hVUtrCEYTOFpc1dG499iqT4oOlUurE4+izKXV0Um6vii
 /pFAf4GEO4uDqbYpj12D/Nvf4KsATlCq18xaGAJw5zjDW05IlnHrcfFYQ0zhJbIShDwU=;
Received: from mail-vs1-f46.google.com ([209.85.217.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nrbEI-008ZKO-M8
 for squashfs-devel@lists.sourceforge.net; Thu, 19 May 2022 08:09:58 +0000
Received: by mail-vs1-f46.google.com with SMTP id w10so2178186vsa.4
 for <squashfs-devel@lists.sourceforge.net>;
 Thu, 19 May 2022 01:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6CHqFUc2pzrLwDPfZGytZQ03T9cBPjhPzdLcOw4RoFA=;
 b=UbduS0B4a9VwGpxuxp3hYbv9y3h6h5rQFZpKQZ8qHUt7CDX0YahUxcwgoVq6NXDprY
 BMn44pHe9GlexYKSvuqDN6IC9F8Jr4J8DnB3t4ugT/7J7B2mxwncPcv3L+i8olECR3lD
 kuCHUqj7f7h8CGhjhfzNXibGCmlgzSvbntMys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6CHqFUc2pzrLwDPfZGytZQ03T9cBPjhPzdLcOw4RoFA=;
 b=bolZOC6ZcTf4mpsWF8r5g4pz6hPjUaLVkd5M0LZ0sISzinuQniGeXD2OL5ZKy+2mXZ
 t39lqaw4MIUYLBo7UcJC5VuaDtSIGSty+zpj94/W+gsu35c0jH1KBQ2SXhMXsBWza4BD
 6yqieJEh3DNslbUlgaE7jvpferbiiuHonYpK57TJCb0Jo7ZimFTNh1w4fbq9Mp2GsY2C
 6FcKSXk0pw838CastSBCbjEe+4pOoqofRgca455cE5XwmeCV41mu98mzbVrVI9GKtxag
 HRYHibgrsmhX4Qjscvg+4nvu6AFJo76G89zthWQ5h/bFeu47SbkGpMKOu0jDM4D7788w
 4exg==
X-Gm-Message-State: AOAM531txeRJvQcIcIztXkcCQsvtMXyDXr/jwqVciWqtiaui2XBVraMm
 fZ93Tv0uYzq3XvuLnVWbxPpcfB3RzIEwC2/6e1A0CA==
X-Google-Smtp-Source: ABdhPJyR0wfOdCkx9Ln3PXfB2tqqXTqSE4JnMb4pcTmgGOXyrijxP0mjju1tZU9SOZGyIg55wKrOSMCUloO1vRhUDvw=
X-Received: by 2002:a05:6102:3a76:b0:32c:e483:3e45 with SMTP id
 bf22-20020a0561023a7600b0032ce4833e45mr1650908vsb.19.1652947787618; Thu, 19
 May 2022 01:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220517082650.2005840-1-hsinyi@chromium.org>
 <20220517082650.2005840-4-hsinyi@chromium.org>
In-Reply-To: <20220517082650.2005840-4-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 19 May 2022 16:09:21 +0800
Message-ID: <CAJMQK-hovwXsuVUDD6-eueD05srWVdx1OWZ9vBdp-bT6De25ig@mail.gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>, 
 Xiongwei Song <Xiongwei.Song@windriver.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 17,
 2022 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org>
 wrote: > > Implement readahead callback for squashfs. It will read datablocks
 > which cover pages in readahead request. For a few cas [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.46 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.46 listed in list.dnswl.org]
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
X-Headers-End: 1nrbEI-008ZKO-M8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Tue, May 17, 2022 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Implement readahead callback for squashfs. It will read datablocks
> which cover pages in readahead request. For a few cases it will
> not mark page as uptodate, including:
> - file end is 0.
> - zero filled blocks.
> - current batch of pages isn't in the same datablock or not enough in a
>   datablock.
> Otherwise pages will be marked as uptodate. The unhandled pages will be
> updated by readpage later.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Reported-by: Phillip Lougher <phillip@squashfs.org.uk>
> Reported-by: Xiongwei Song <sxwjean@gmail.com>
> ---
> v1->v2: remove unused check on readahead_expand().
> v1: https://lore.kernel.org/lkml/20220516105100.1412740-3-hsinyi@chromium.org/
> ---

Hi Phillip and Matthew,

Regarding the performance issue of this patch, I saw a possible
performance gain if we only read the first block instead of reading
until nr_pages == 0.

To be more clear, apply the following diff (Please ignore the skipping
of nr_pages check first. This is a demonstration of "only read and
update the first block per readahead call"):

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index aad6823f0615..c52f7c4a7cfe 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -524,10 +524,8 @@ static void squashfs_readahead(struct
readahead_control *ractl)
        if (!actor)
                goto out;

-       for (;;) {
+       {
                nr_pages = __readahead_batch(ractl, pages, max_pages);
-               if (!nr_pages)
-                       break;

                if (readahead_pos(ractl) >= i_size_read(inode) ||
                    nr_pages < max_pages)


All the performance numbers:
1. original: 39s
2. revert "mm: put readahead pages in cache earlier": 2.8s
3. v2 of this patch: 2.7s
4. v2 of this patch and apply the diff: 1.8s

In my testing data, normally it reads and updates 1~2 blocks per
readahead call. The change might not make sense since the performance
improvement may only happen in certain cases.

What do you think? Or is the performance of the current patch
considered reasonable?

Thanks.

testing env:
- arm64 on kernel 5.10
- data: ~ 300K pack file contains some android files

>  fs/squashfs/file.c | 77 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
>
> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> index a8e495d8eb86..e10a55c5b1eb 100644
> --- a/fs/squashfs/file.c
> +++ b/fs/squashfs/file.c
> @@ -39,6 +39,7 @@
>  #include "squashfs_fs_sb.h"
>  #include "squashfs_fs_i.h"
>  #include "squashfs.h"
> +#include "page_actor.h"
>
>  /*
>   * Locate cache slot in range [offset, index] for specified inode.  If
> @@ -495,7 +496,81 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
>         return 0;
>  }
>
> +static void squashfs_readahead(struct readahead_control *ractl)
> +{
> +       struct inode *inode = ractl->mapping->host;
> +       struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
> +       size_t mask = (1UL << msblk->block_log) - 1;
> +       size_t shift = msblk->block_log - PAGE_SHIFT;
> +       loff_t start = readahead_pos(ractl) &~ mask;
> +       size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
> +       struct squashfs_page_actor *actor;
> +       unsigned int nr_pages = 0;
> +       struct page **pages;
> +       u64 block = 0;
> +       int bsize, res, i, index;
> +       int file_end = i_size_read(inode) >> msblk->block_log;
> +       unsigned int max_pages = 1UL << shift;
> +
> +       readahead_expand(ractl, start, (len | mask) + 1);
> +
> +       if (file_end == 0)
> +               return;
> +
> +       pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
> +       if (!pages)
> +               return;
> +
> +       actor = squashfs_page_actor_init_special(pages, max_pages, 0);
> +       if (!actor)
> +               goto out;
> +
> +       for (;;) {
> +               nr_pages = __readahead_batch(ractl, pages, max_pages);
> +               if (!nr_pages)
> +                       break;
> +
> +               if (readahead_pos(ractl) >= i_size_read(inode) ||
> +                   nr_pages < max_pages)
> +                       goto skip_pages;
> +
> +               index = pages[0]->index >> shift;
> +               if ((pages[nr_pages - 1]->index >> shift) != index)
> +                       goto skip_pages;
> +
> +               bsize = read_blocklist(inode, index, &block);
> +               if (bsize == 0)
> +                       goto skip_pages;
> +
> +               res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
> +                                        actor);
> +
> +               if (res >= 0)
> +                       for (i = 0; i < nr_pages; i++)
> +                               SetPageUptodate(pages[i]);
> +
> +               for (i = 0; i < nr_pages; i++) {
> +                       unlock_page(pages[i]);
> +                       put_page(pages[i]);
> +               }
> +       }
> +
> +       kfree(actor);
> +       kfree(pages);
> +       return;
> +
> +skip_pages:
> +       for (i = 0; i < nr_pages; i++) {
> +               unlock_page(pages[i]);
> +               put_page(pages[i]);
> +       }
> +
> +       kfree(actor);
> +out:
> +       kfree(pages);
> +}
>
>  const struct address_space_operations squashfs_aops = {
> -       .read_folio = squashfs_read_folio
> +       .read_folio = squashfs_read_folio,
> +       .readahead = squashfs_readahead
>  };
> --
> 2.36.0.550.gb090851708-goog
>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
