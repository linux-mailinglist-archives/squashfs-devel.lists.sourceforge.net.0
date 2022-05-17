Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667952E336
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZh-0007HP-QZ; Fri, 20 May 2022 03:45:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sxwjean@gmail.com>) id 1nqtJf-0000iw-KO
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 09:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VbT9MivaGcVQLFLyZe58CMZOydl8bMnPHecbxMnGlAA=; b=Dhgcz9YLNR+IM3PnEBcCdmTYgb
 2W9WwnzPO3xwNH0aAL9nzgTwWkIpP0In18eafnAI6Z8ryHBSQaVdQncI+VKiyPIEoAvfQ7C0HOXpC
 aJTDaeuIG3ugPQiitKTv4g2MFy8KMuKfLMMEsUn2un+55NkJCzFnnFcE/U7+hrVnNYm0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VbT9MivaGcVQLFLyZe58CMZOydl8bMnPHecbxMnGlAA=; b=PuVS6lkG4v0sJ9U5twN5GhgoF+
 AYkcTGhDfI4fpo/LEqGHvpEKCPY4m51hYjjnURIySS1W/ew6Opj3KjqGj83jghlbisGatsoGkWsuw
 1xkLvy1j0fNE4yn6wFtOzgUaKKAA/sLQxQcsypZtanzdG7onDKehGD1+gmxaAdgyHKaw=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqtJe-003Cuh-Cy
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 09:16:30 +0000
Received: by mail-pf1-f171.google.com with SMTP id y41so16324878pfw.12
 for <squashfs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VbT9MivaGcVQLFLyZe58CMZOydl8bMnPHecbxMnGlAA=;
 b=K926XyreguR/4XEGI2/XdLSg8xqkk79XZxpz2krQ3cDJULT8zIyem67TELbGWBtmTg
 b05B8JjUy+SFZn96XQv2wbJdy6P1+68y3XmUl2REMzKOsiCerWpY4gxfkPaXYimAbdMw
 aPDfZjT5rKLnZhvekRWx46Led/eHS37TdbpQ+k2rA3u5jcJAA1qE4EjEdY61h/y1aGDJ
 HwKKYCRVUMiHvXIhC9uLV+1DSufpqUQKWO7jZmK8YgLeFAdxBOwUCCjPXoideDBIZwgv
 +DFJROmmKg7yUnB015J5PHMAo6BmnjJV06lEU25NzkLOxPGGWKOdzM+q3EK1WrqC3yTM
 NXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VbT9MivaGcVQLFLyZe58CMZOydl8bMnPHecbxMnGlAA=;
 b=4GR4T18I3Zng1TAzhTt5erFPWNSNCSOZu9cAQhVHdUnGB3ByJeo2Sr2rPuBeDr0TDe
 sfgD1rHZqgxlb+tkYh8DYS0yG2Shzi/b9G1Z9O7V9Rv2UoVg0vd8E4406D+YFQE0K3Cr
 4OxRaAMRtMQQWUCNN7n47/UzoDaLACnsSmZYVRQf3R8rcXdNZcd3Yn8RcQjaH4kOY6s/
 UwIuAUCXfOwmCLNoTiTH+6c7UhOnP/rnNBhECDB4XP/cmOPAOra0zzLGaKjvQfAYo5aO
 9mvw40mUEZD65IxCm3q5REeYzh0E8/pR+SbGW44c3WWuTivSCEPWDj7EdXoqnuI0O55H
 EHpA==
X-Gm-Message-State: AOAM530jnIU26S1VdeuzfKbYcpWEDh1G3lH6ZWxxqJxDRcKl8DR7OOKQ
 +2tSgQrLx18g6tenX2Dr4IjrotFaZFEmIth4+Gw=
X-Google-Smtp-Source: ABdhPJwb7TUPydJ5uJgGFBM3zIUz6PP1+ayvhR0HdyDTVVnTuilVTQ3Ohszxg4ss5MiddupCWgYYK0W77rGbKie7r8Q=
X-Received: by 2002:a63:4d4:0:b0:3c1:f13f:a9a1 with SMTP id
 203-20020a6304d4000000b003c1f13fa9a1mr18365793pge.398.1652778984401; Tue, 17
 May 2022 02:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220517082650.2005840-1-hsinyi@chromium.org>
 <20220517082650.2005840-2-hsinyi@chromium.org>
In-Reply-To: <20220517082650.2005840-2-hsinyi@chromium.org>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Tue, 17 May 2022 17:15:58 +0800
Message-ID: <CAEVVKH8vOYov+edGWOWbrgi=5UAnNN4FzcAV5i3EVJ8S7_NSDw@mail.gmail.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 17, 2022 at 4:27 PM Hsin-Yi Wang wrote: > > This
 reverts commit 9eec1d897139e5de287af5d559a02b811b844d82. > > Revert closing
 the readahead to squashfs since the readahead callback > for [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sxwjean[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nqtJe-003Cuh-Cy
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: Re: [Squashfs-devel] [PATCH v2 1/3] Revert "squashfs: provide
 backing_dev_info in order to disable read-ahead"
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

On Tue, May 17, 2022 at 4:27 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> This reverts commit 9eec1d897139e5de287af5d559a02b811b844d82.
>
> Revert closing the readahead to squashfs since the readahead callback
> for squashfs is implemented.
>
> Suggested-by: Xiongwei Song <sxwjean@gmail.com>

I'd like to use "xiongwei.song@windriver.com" in my tag.

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  fs/squashfs/super.c | 33 ---------------------------------
>  1 file changed, 33 deletions(-)
>
> diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
> index 6d594ba2ed28..32565dafa7f3 100644
> --- a/fs/squashfs/super.c
> +++ b/fs/squashfs/super.c
> @@ -29,7 +29,6 @@
>  #include <linux/module.h>
>  #include <linux/magic.h>
>  #include <linux/xattr.h>
> -#include <linux/backing-dev.h>
>
>  #include "squashfs_fs.h"
>  #include "squashfs_fs_sb.h"
> @@ -113,24 +112,6 @@ static const struct squashfs_decompressor *supported_squashfs_filesystem(
>         return decompressor;
>  }
>
> -static int squashfs_bdi_init(struct super_block *sb)
> -{
> -       int err;
> -       unsigned int major = MAJOR(sb->s_dev);
> -       unsigned int minor = MINOR(sb->s_dev);
> -
> -       bdi_put(sb->s_bdi);
> -       sb->s_bdi = &noop_backing_dev_info;
> -
> -       err = super_setup_bdi_name(sb, "squashfs_%u_%u", major, minor);
> -       if (err)
> -               return err;
> -
> -       sb->s_bdi->ra_pages = 0;
> -       sb->s_bdi->io_pages = 0;
> -
> -       return 0;
> -}
>
>  static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
>  {
> @@ -146,20 +127,6 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
>
>         TRACE("Entered squashfs_fill_superblock\n");
>
> -       /*
> -        * squashfs provides 'backing_dev_info' in order to disable read-ahead. For
> -        * squashfs, I/O is not deferred, it is done immediately in read_folio,
> -        * which means the user would always have to wait their own I/O. So the effect
> -        * of readahead is very weak for squashfs. squashfs_bdi_init will set
> -        * sb->s_bdi->ra_pages and sb->s_bdi->io_pages to 0 and close readahead for
> -        * squashfs.
> -        */
> -       err = squashfs_bdi_init(sb);
> -       if (err) {
> -               errorf(fc, "squashfs init bdi failed");
> -               return err;
> -       }
> -
>         sb->s_fs_info = kzalloc(sizeof(*msblk), GFP_KERNEL);
>         if (sb->s_fs_info == NULL) {
>                 ERROR("Failed to allocate squashfs_sb_info\n");
> --
> 2.36.0.550.gb090851708-goog
>
>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
