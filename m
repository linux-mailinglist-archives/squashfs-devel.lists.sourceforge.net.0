Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F94052E340
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007Ir-H7; Fri, 20 May 2022 03:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqYWq-0007eJ-Pm
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 11:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vkeDkFkYpkmRJ364RgcYqVHpDHCVzTSeOQ89Cq0MtS8=; b=Dom9NQXPwlhsiOveiY3KzKc3kP
 tRV9dEqpVGgrpRS0HT1DF4o83QewWNJ/vxbDjaC/C6Q7wPAldUSik831A813jE6CbaPbRynh+zYS8
 /TojK6WPKLpqzumWy/TBkkTPz4gRraMYlhbqP0AfIBWE1WnDykH9FcEsn5Lb45q4mYVQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vkeDkFkYpkmRJ364RgcYqVHpDHCVzTSeOQ89Cq0MtS8=; b=IF+ilEx2zuA1kZB+fLUJzrh1Ln
 PalMTshJNP/UQiQrpxxjBlR9BI6bX3G7r9LBnLhnITK3HKZF3JlLMUIXK6DMuPoSh0gVAwgn10agq
 cj0Qt/vBuUdkqCBJaEajMNv1HApq3ESMyQ8kxSBhzE222vCYct/9tL7d7F8z+35xcd3s=;
Received: from mail-vs1-f54.google.com ([209.85.217.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqYWm-0005Ae-J3
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 11:04:42 +0000
Received: by mail-vs1-f54.google.com with SMTP id c62so15070398vsc.10
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 04:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vkeDkFkYpkmRJ364RgcYqVHpDHCVzTSeOQ89Cq0MtS8=;
 b=S5+KmO4aosUfRV541We6wTd6sve2C2jxofS550PddoyoaVJyjTlteA1h6W6VFPgoyA
 HCgQ7fPNUxmrLAVaKGHu9qXG6jQkUitCp/l3whsMngT4ONWPKuQhQxL493inaHD5bLee
 t5wT7tF+V/bEUVcxyxY0dirsJhDND54dcGfzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vkeDkFkYpkmRJ364RgcYqVHpDHCVzTSeOQ89Cq0MtS8=;
 b=hmsE38keYR2kZL8496T8/01LCLOZPBWxp6B8Q9o6bAyEbgl8nErQ9HzxP9m8hfIu2a
 1Ltdv9RtyZDv6IDrF3hhT2WSOW56IOh5tW5yPVQVGwsAG5SnOeMfsMT5Pf1YTC3Sz9HT
 d+dJxUIA85RPhQKzgT3/pkejlzAh1Fb6mtexqZUjF+GJ4uPygTYvOcWzn9Qigmjry6xp
 9vhfUuH2Go5z7CwSdYqQB7Mh/MOCI6xA/XMq1WNOMpykpwYunweXv+wqa6gFJSmSTLNo
 Ic404UIV2JMgph4bcNxnDp9xgwnUFx4aS8DNECWeu3HVxJzzsvvtClLRTQxrIUVfuInp
 nWfA==
X-Gm-Message-State: AOAM531hSKrTVAP5GsH++2HVxBE6YPQVCM+wy2cI+6oLxQGyhdpqCOVq
 nUmkRy2zN4sBTi5txkfxZBzUxf4TeZumJxxDDk5ujg==
X-Google-Smtp-Source: ABdhPJy/t2EK0wj7DIUgHQJxkAvMKiBtEuItKuf9ivBIXzsz1re04fcHg/GAOshdJcGvYzYj1/2wgalPsfQJVHRkehM=
X-Received: by 2002:a05:6102:558f:b0:32d:7901:edcc with SMTP id
 dc15-20020a056102558f00b0032d7901edccmr6119228vsb.80.1652699074738; Mon, 16
 May 2022 04:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220516105100.1412740-1-hsinyi@chromium.org>
 <20220516105100.1412740-3-hsinyi@chromium.org>
In-Reply-To: <20220516105100.1412740-3-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 May 2022 19:04:08 +0800
Message-ID: <CAJMQK-jjNRuZFOJrd2knQHwPERaJ64pyys+14cCVyfdsP1GZSQ@mail.gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>, 
 Xiongwei Song <Xiongwei.Song@windriver.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 16,
 2022 at 6:51 PM Hsin-Yi Wang <hsinyi@chromium.org>
 wrote: > > Implement readahead callback for squashfs. It will read datablocks
 > which cover pages in readahead request. For a few cas [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.54 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqYWm-0005Ae-J3
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: Re: [Squashfs-devel] [PATCH 2/2] squashfs: implement readahead
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

On Mon, May 16, 2022 at 6:51 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
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
Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Note that this patch was not formally sent to the list before. It's
> attached to email thread for discussion as it's still under development.
>
> - v1:
> The patch outline was suggested by Matthew. It went through a few
> reviews by Matthew offline.
>
> - v2:
> https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m442435c149d411c5c9d8019cff5915419b04bf10
> This is a resend of v1.
>
> - v3:
> https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m55a709e6ba5ec59fe95323a67a7f3d6b1953e470
> Fix page actor size to avoid a crash from squashfs_decompress().
> Suggested by Phillip Lougher[1]
> [1] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m687f82debb7667ff31982a05aef3eba081eb5039
>
> - v4:
> https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#mf93267690ec2e841dade6a494fe72c84b61328d9
> Fix to free page after used. Suggested by Xiongwei Song[2]
> Refactor the skip page logic to possible improve the performance.
> Suggested by Phillip Lougher[3]
> [2] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m0e7b33d167b1ef0eb39b9f41c32ed3f80dfced18
> [3] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m1e0a8f8e4a98d79d14c81b66e197b6dc0a3b77a1
> ---
>  fs/squashfs/file.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>
> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> index a8e495d8eb86..91dfec792f4c 100644
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
> @@ -495,7 +496,83 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
>         return 0;
>  }
>
> +static void squashfs_readahead(struct readahead_control *ractl)
> +{
> +       struct inode *inode = ractl->mapping->host;
> +       struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
> +       size_t mask = (1UL << msblk->block_log) - 1;
> +       size_t shift = msblk->block_log - PAGE_SHIFT;
> +       loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);
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
> +       if (readahead_pos(ractl) + readahead_length(ractl) < req_end ||
> +           file_end == 0)
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
>         .read_folio = squashfs_read_folio
> +       .readahead = squashfs_readahead
>  };
> --
> 2.36.0.550.gb090851708-goog
>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
