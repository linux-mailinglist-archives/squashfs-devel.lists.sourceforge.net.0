Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3E052E34E
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007Jt-Q5; Fri, 20 May 2022 03:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sxwjean@gmail.com>) id 1nqtKT-0002J5-T2
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 09:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E8YGWSWWojih1VKbtgTaPJ1Z6S4eE96LyrRQW+VNJuo=; b=USbbGH3GOmfIuteoW4QC5US/dG
 3KJRUEy2jEAdpuhRpc+OhOeAWZkLiiT6EHvxBNdUA65Ojn6Aul1OzvxQtx5muRahlUdit+9Vls5bq
 K4kBSOh119Y1ys/jP60WL/KxGr1HeoZHyU6fmw1CLrtilLPfGLwJaFiiZjFeQ8BMZHH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E8YGWSWWojih1VKbtgTaPJ1Z6S4eE96LyrRQW+VNJuo=; b=PA7llrvL76rDvQcgVEZ448/UFU
 YO8M9IDl9H/tUBHluDsBgISvAdwa190uegXMGz8SCCRDPZL6fxaj9T37lGXSd0kbp3j/BjuoCH1VU
 5FxEIRBIERlXR2kAaqfCbjmeCDbpL9jphaaIP2TElCoXZM6dRFDAO4v52hmTm6HQGtF4=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqtKN-003D6n-Oe
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 09:17:20 +0000
Received: by mail-pf1-f177.google.com with SMTP id j6so16322053pfe.13
 for <squashfs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 02:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8YGWSWWojih1VKbtgTaPJ1Z6S4eE96LyrRQW+VNJuo=;
 b=JI/N/9lYrny+vGuuJmW/Mz1EwloPiEjhN5PZon9WeBaiDjglsT4Enu5a5xHVRZowOg
 9f3A17ll9qIQChEyLVLsVampoZaCPeLaG4XBeilDJhXBWZbrmNaGpxkZOVLYFaQLD6yh
 /m2bw9s2rGOy5vAk+xOFwaw/t8tuyJV2+DyDH+XizMJ6Gm5RhK7wbA1qpyUv7p3SdWZr
 DHfk71IEAw0lPD8PMXyKfPLy8XSSFX2sAnqmA9/yObH9mgCAlICK9Y2fzSydlVHpzxhR
 9KZFz/lLG0hIcoEFXrFxC6O06kxPgggx5ocXTGPVirYrnk1XPOE+jT9zbPorcmfYK9q2
 2h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8YGWSWWojih1VKbtgTaPJ1Z6S4eE96LyrRQW+VNJuo=;
 b=JaBDlBOknng4kM5UCHAM0adSxBP8fv5wYVAFcO8vOQFrNlGdMBufccRhbU74uvRvRJ
 wYOE2uCFc+KTWUwkLmmZbE3XTvfH5lqxiuxR6NuH8bsvi4024gbXuPk27T9F5V9mouQw
 5ovVG71owZcaGl3jLYqfyth9TZSsHa+CqhjI6KfKCFoAKBKxe3aIIjuC1T6AtewOjH3b
 +aTaN2HBe8ksUY1Jvd8hj0KzdeDGyE45OnK37+6Gy9Xy+lf9x8Ec72e1CpcmzEbHFmxW
 aKK2mbodxVt9/5bEg0uFr+d/rNTpSFrbFh0a6nny48u0xtiNajWWmPnkmh2KTynxqPjp
 HGCA==
X-Gm-Message-State: AOAM533nF/Mq5x3ioer0Uc9ol4bbNI2h4xHTsoHW46aSWp38ntfbh+nd
 9WzBh9qzgY3mrxVcBQFXr1usT2B7qhDKj7nU+sE=
X-Google-Smtp-Source: ABdhPJyQmaSFdo5O73mmcLowlQG4SBLDZevrKgfoPfruisJEss3MbayYyRyPbPsBJRt31o5gOkJvjo7bWF5VvtSyJEA=
X-Received: by 2002:a05:6a00:244a:b0:4fa:ebf9:75de with SMTP id
 d10-20020a056a00244a00b004faebf975demr21562526pfj.73.1652779028918; Tue, 17
 May 2022 02:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220517082650.2005840-1-hsinyi@chromium.org>
 <20220517082650.2005840-4-hsinyi@chromium.org>
In-Reply-To: <20220517082650.2005840-4-hsinyi@chromium.org>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Tue, 17 May 2022 17:16:42 +0800
Message-ID: <CAEVVKH8vJ4KZ8VX=paXdZ7Ci8rLF=nh4OA2eP96JzUDeeGEtJQ@mail.gmail.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 17,
 2022 at 4:28 PM Hsin-Yi Wang wrote: > > Implement
 readahead callback for squashfs. It will read datablocks > which cover pages
 in readahead request. For a few cases it will > not mar [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.177 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sxwjean[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nqtKN-003D6n-Oe
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Hou Tao <houtao1@huawei.com>,
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

"xiongwei.song@windriver.com" too.

> ---
> v1->v2: remove unused check on readahead_expand().
> v1: https://lore.kernel.org/lkml/20220516105100.1412740-3-hsinyi@chromium.org/
> ---
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
>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
