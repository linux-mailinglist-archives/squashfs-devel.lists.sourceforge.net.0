Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B242652E349
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZl-0007NV-Ed; Fri, 20 May 2022 03:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqs59-0006yx-Ua
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 07:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WShrHtR7o1bEMN+GHtHpoPB1ADyCcz+AwfB1sJZyYR4=; b=WU5NjH9GPPiJVfDVjpmgS0B5xA
 Fbj8JN4SH81xgpYTC1lsNyclcGeX21K8kECAC33/flHBE+1l+srVFu9JWIejX+NoxCxWISr6lBXrT
 97C/g0jVjBlNOC62EC6kGhMbRF9MfnLjxPloIr6ujb2C4uN3ThOby9/yxpcGBbDb/uOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WShrHtR7o1bEMN+GHtHpoPB1ADyCcz+AwfB1sJZyYR4=; b=SUqwbm0xa9iDhg859s5yuxoIPp
 KeQoiSmtPDGSRKbXlox4c1WpTa02yiVWG5I5Y+9+Od0sNTv1MxDOJeUmSdVBbm4sq+V5N+S4d94rb
 024+WJ5TZyoXGWOvC/szb37Y+DAAcTUBOcroU8rYBlP5XY1i2Qr+BWgw2SF1B9YOzc28=;
Received: from mail-yb1-f177.google.com ([209.85.219.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqs59-00056Q-Ix
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 07:57:28 +0000
Received: by mail-yb1-f177.google.com with SMTP id e78so10036543ybc.12
 for <squashfs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WShrHtR7o1bEMN+GHtHpoPB1ADyCcz+AwfB1sJZyYR4=;
 b=LOFlwn77BRGGTHQ9iEWKPwBc8EC7NIg2bDsjKTz7PFhls9SUyJa0RoGbGs4i0gbs2h
 FhVaPs5DErd6RbgHLLK0Psn0eW45ltdzDAmbdKIaYF8kbVhy3CrR3d7qdO6TueERI14t
 1nslAb6aebvVqxtyL6KGKnnuTrLo4NW+MwcPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WShrHtR7o1bEMN+GHtHpoPB1ADyCcz+AwfB1sJZyYR4=;
 b=iiVgAE39UXtTnhUqxtM9kBF2Z4eB6RiOavGoY/8Vfxp/HV0lkMGefYufv1z3E8c2HD
 goE3J46ruRZeXMIDI4JRuj2Jpw0N1o5eKsup0kjjkx+fTGKMBocp8T48t5GrUgoV0kuv
 Q79ZZhzmWphBUpf3G6XVTEbmc+BsMKaIxyAsm0s+zuyJcJdP+N6e2LrxLxo5FZ6yFicj
 PHVFYKgIrp8K7oUskv51can3muM/sU8Y4IYHixrEW5ZocIiPsGtQvR2/FX8k1N3ga7hx
 Kicg3yWShtTW0vz9NL2n3DdQbJlqgZ6a8WsFMaB++Rnh7YltkHDCQWiIsbaP8FMuBxgD
 TI1Q==
X-Gm-Message-State: AOAM533LUV2XhToqW+YsxxtT9VA3SCE1kRMZ+ZzZFUJNFJzKr4VgWiYl
 XJ5cnZ2wUvbQ9NcfvYyRVwul1lEoFUWZ+ETwvDyKB7BUUS8QpA==
X-Google-Smtp-Source: ABdhPJwEplLYKvh+UGWkRWwFL7aUrldDFea1pw9lk57FA3WLEL60dkwzpZTESwKPQX9FIONp5mTUpyvS1luMK3t7Bqs=
X-Received: by 2002:a9f:3193:0:b0:35d:21ec:4ae1 with SMTP id
 v19-20020a9f3193000000b0035d21ec4ae1mr7292105uad.100.1652773918317; Tue, 17
 May 2022 00:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220516105100.1412740-1-hsinyi@chromium.org>
 <20220517033557.3492-1-phillip@squashfs.org.uk>
In-Reply-To: <20220517033557.3492-1-phillip@squashfs.org.uk>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 17 May 2022 15:51:32 +0800
Message-ID: <CAJMQK-g2G=yDC9GW9Kcpuia+kdOcH_-WpR8xyLvx+5w0BHJJmg@mail.gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 17,
 2022 at 11:36 AM Phillip Lougher <phillip@squashfs.org.uk>
 wrote: > > Squashfs_readahead uses the "file direct" version of the page
 > actor, and so build it unconditionally. > > Report [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.177 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqs59-00056Q-Ix
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: Re: [Squashfs-devel] [PATCH 3/2] squashfs: always build "file
 direct" version of page actor
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
Cc: Xiongwei.Song@windriver.com, kernel test robot <lkp@intel.com>,
 squashfs-devel@lists.sourceforge.net, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 zhengliang6@huawei.com, houtao1@huawei.com, akpm@linux-foundation.org,
 miaoxie@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Tue, May 17, 2022 at 11:36 AM Phillip Lougher
<phillip@squashfs.org.uk> wrote:
>
> Squashfs_readahead uses the "file direct" version of the page
> actor, and so build it unconditionally.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested with CONFIG_SQUASHFS_FILE_DIRECT unselected. I'll pick this
patch to the series. Thanks

> ---
>  fs/squashfs/Makefile     |  4 ++--
>  fs/squashfs/page_actor.h | 41 ----------------------------------------
>  2 files changed, 2 insertions(+), 43 deletions(-)
>
> diff --git a/fs/squashfs/Makefile b/fs/squashfs/Makefile
> index 7bd9b8b856d0..477c89a519ee 100644
> --- a/fs/squashfs/Makefile
> +++ b/fs/squashfs/Makefile
> @@ -5,9 +5,9 @@
>
>  obj-$(CONFIG_SQUASHFS) += squashfs.o
>  squashfs-y += block.o cache.o dir.o export.o file.o fragment.o id.o inode.o
> -squashfs-y += namei.o super.o symlink.o decompressor.o
> +squashfs-y += namei.o super.o symlink.o decompressor.o page_actor.o
>  squashfs-$(CONFIG_SQUASHFS_FILE_CACHE) += file_cache.o
> -squashfs-$(CONFIG_SQUASHFS_FILE_DIRECT) += file_direct.o page_actor.o
> +squashfs-$(CONFIG_SQUASHFS_FILE_DIRECT) += file_direct.o
>  squashfs-$(CONFIG_SQUASHFS_DECOMP_SINGLE) += decompressor_single.o
>  squashfs-$(CONFIG_SQUASHFS_DECOMP_MULTI) += decompressor_multi.o
>  squashfs-$(CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU) += decompressor_multi_percpu.o
> diff --git a/fs/squashfs/page_actor.h b/fs/squashfs/page_actor.h
> index 2e3073ace009..26e07373af8a 100644
> --- a/fs/squashfs/page_actor.h
> +++ b/fs/squashfs/page_actor.h
> @@ -6,46 +6,6 @@
>   * Phillip Lougher <phillip@squashfs.org.uk>
>   */
>
> -#ifndef CONFIG_SQUASHFS_FILE_DIRECT
> -struct squashfs_page_actor {
> -       void    **page;
> -       int     pages;
> -       int     length;
> -       int     next_page;
> -};
> -
> -static inline struct squashfs_page_actor *squashfs_page_actor_init(void **page,
> -       int pages, int length)
> -{
> -       struct squashfs_page_actor *actor = kmalloc(sizeof(*actor), GFP_KERNEL);
> -
> -       if (actor == NULL)
> -               return NULL;
> -
> -       actor->length = length ? : pages * PAGE_SIZE;
> -       actor->page = page;
> -       actor->pages = pages;
> -       actor->next_page = 0;
> -       return actor;
> -}
> -
> -static inline void *squashfs_first_page(struct squashfs_page_actor *actor)
> -{
> -       actor->next_page = 1;
> -       return actor->page[0];
> -}
> -
> -static inline void *squashfs_next_page(struct squashfs_page_actor *actor)
> -{
> -       return actor->next_page == actor->pages ? NULL :
> -               actor->page[actor->next_page++];
> -}
> -
> -static inline void squashfs_finish_page(struct squashfs_page_actor *actor)
> -{
> -       /* empty */
> -}
> -#else
>  struct squashfs_page_actor {
>         union {
>                 void            **buffer;
> @@ -76,4 +36,3 @@ static inline void squashfs_finish_page(struct squashfs_page_actor *actor)
>         actor->squashfs_finish_page(actor);
>  }
>  #endif
> -#endif
> --
> 2.34.1
>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
